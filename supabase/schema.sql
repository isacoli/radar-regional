-- Radar Regional — esquema de base de datos (Supabase / Postgres)
-- Ejecutar una vez en Supabase: SQL Editor → New query → pegar todo → Run.
-- Es idempotente: se puede volver a ejecutar sin perder datos.

-- ─────────────────────────────────────────────
-- 1. Ediciones (una fila por boletín final)
-- ─────────────────────────────────────────────
create table if not exists public.ediciones (
  id               bigint generated always as identity primary key,
  slug             text not null unique,            -- p. ej. 'diario-2026-10-23', 'semanal-2026-10-23'
  tipo             text not null check (tipo in ('diario','semanal','tematico')),
  numero           int,
  fecha            date not null,                   -- fecha de la edición (día de publicación)
  ventana_inicio   timestamptz,
  ventana_fin      timestamptz,
  titulo           text,
  resumen          text,                            -- «Resumen del día» o introducción
  n_noticias       int default 0,
  n_investigaciones int default 0,
  url_web          text,                            -- enlace en GitHub Pages
  html             text,                            -- HTML completo del boletín
  creado_en        timestamptz not null default now(),
  actualizado_en   timestamptz not null default now()
);

-- ─────────────────────────────────────────────
-- 2. Noticias (una fila por titular publicado)
-- ─────────────────────────────────────────────
create table if not exists public.noticias (
  id                bigint generated always as identity primary key,
  edicion_id        bigint not null references public.ediciones(id) on delete cascade,
  posicion          int not null,                  -- número en el boletín
  destacada         boolean not null default false, -- tarjeta de «Lo más destacado»
  titular           text not null,
  resumen           text,                          -- frase de la tarjeta o resumen (si existe)
  por_que_importa   text,
  url               text not null,
  fuente            text,
  pais              text,
  categoria         text,
  proposito         text,                          -- Benchmarking, Inspiración, Oportunidad, Contexto
  mas_difundida     boolean not null default false,
  mas_relevante     boolean not null default false,
  difusion          int,                           -- n.º de fuentes independientes
  relevancia        int,                           -- 1–5
  fecha_publicacion date,
  busqueda          tsvector generated always as (
                      to_tsvector('spanish',
                        coalesce(titular,'') || ' ' || coalesce(resumen,'') || ' ' ||
                        coalesce(por_que_importa,'') || ' ' || coalesce(fuente,'') || ' ' ||
                        coalesce(pais,'') || ' ' || coalesce(categoria,''))
                    ) stored,
  unique (edicion_id, posicion)
);

-- ─────────────────────────────────────────────
-- 3. Investigaciones (una fila por publicación destacada)
-- ─────────────────────────────────────────────
create table if not exists public.investigaciones (
  id                bigint generated always as identity primary key,
  edicion_id        bigint not null references public.ediciones(id) on delete cascade,
  posicion          int not null,
  titulo_es         text not null,
  titulo_original   text,
  autores           text,                          -- «Primer autor et al.»
  revista           text,                          -- revista o serie
  tipo              text check (tipo in ('articulo','documento_de_trabajo')),
  ambito            text check (ambito in ('Regional','Global')),
  acceso_abierto    boolean,
  mas_relevante     boolean not null default false,
  hallazgo          text,
  url               text not null,                 -- DOI o página oficial
  fecha_publicacion date,
  ranking           text,                          -- verificación Q1 (fuente y área)
  busqueda          tsvector generated always as (
                      to_tsvector('spanish',
                        coalesce(titulo_es,'') || ' ' || coalesce(titulo_original,'') || ' ' ||
                        coalesce(hallazgo,'') || ' ' || coalesce(revista,'') || ' ' || coalesce(autores,''))
                    ) stored,
  unique (edicion_id, posicion)
);

-- Índices
create index if not exists noticias_busqueda_idx        on public.noticias        using gin (busqueda);
create index if not exists investigaciones_busqueda_idx on public.investigaciones using gin (busqueda);
create index if not exists noticias_edicion_idx         on public.noticias (edicion_id);
create index if not exists noticias_pais_idx            on public.noticias (pais);
create index if not exists noticias_categoria_idx       on public.noticias (categoria);
create index if not exists ediciones_fecha_idx          on public.ediciones (fecha desc);

-- ─────────────────────────────────────────────
-- 4. Vistas de consulta (noticias e investigaciones con su edición)
-- ─────────────────────────────────────────────
create or replace view public.noticias_con_edicion
with (security_invoker = true) as
select n.*, e.slug as edicion_slug, e.tipo as edicion_tipo, e.numero as edicion_numero,
       e.fecha as edicion_fecha, e.url_web as edicion_url
from public.noticias n join public.ediciones e on e.id = n.edicion_id;

create or replace view public.investigaciones_con_edicion
with (security_invoker = true) as
select i.*, e.slug as edicion_slug, e.tipo as edicion_tipo, e.numero as edicion_numero,
       e.fecha as edicion_fecha, e.url_web as edicion_url
from public.investigaciones i join public.ediciones e on e.id = i.edicion_id;

-- ─────────────────────────────────────────────
-- 5. Seguridad: lectura pública, escritura solo con la clave secreta (service_role)
-- ─────────────────────────────────────────────
alter table public.ediciones       enable row level security;
alter table public.noticias        enable row level security;
alter table public.investigaciones enable row level security;

drop policy if exists "lectura publica" on public.ediciones;
drop policy if exists "lectura publica" on public.noticias;
drop policy if exists "lectura publica" on public.investigaciones;
create policy "lectura publica" on public.ediciones       for select to anon, authenticated using (true);
create policy "lectura publica" on public.noticias        for select to anon, authenticated using (true);
create policy "lectura publica" on public.investigaciones for select to anon, authenticated using (true);
-- Sin políticas de insert/update/delete: solo la clave service_role (que ignora RLS) puede escribir.

grant select on public.noticias_con_edicion, public.investigaciones_con_edicion to anon, authenticated;
