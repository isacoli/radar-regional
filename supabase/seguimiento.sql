-- Radar Regional — pestaña «Seguimiento»
-- Ejecutar una vez en Supabase: SQL Editor → New query → pegar todo → Run.
-- Es idempotente: se puede volver a ejecutar sin perder datos.
--
-- Qué puede hacer el público (clave publicable del sitio):
--   · leer los seguimientos y sus avances;
--   · crear un seguimiento (una noticia del Radar + de 1 a 52 semanas);
--   · cambiar SOLO el número de semanas de un seguimiento.
-- No puede borrar, ni cambiar la fecha de inicio, el titular, el enlace o el balance.
-- Los avances y el balance los escribe el Radar diario con la clave secreta (scripts/seguimiento.py).

-- ─────────────────────────────────────────────
-- 1. Seguimientos (una fila por noticia seguida)
-- ─────────────────────────────────────────────
create table if not exists public.seguimientos (
  id              bigint generated always as identity primary key,
  noticia_url     text not null unique,                 -- enlace de la noticia de origen
  titular         text not null,
  pais            text,
  fuente          text,
  categoria       text,
  edicion_numero  int,                                  -- N.º del Radar donde salió
  edicion_fecha   date,
  semanas         int  not null check (semanas between 1 and 52),
  inicio          date not null default ((now() at time zone 'America/Bogota')::date),
  balance         text,                                 -- lo escribe el Radar al terminar el plazo
  creado_en       timestamptz not null default now(),
  actualizado_en  timestamptz not null default now(),
  check (noticia_url like 'https://%' and length(noticia_url) <= 600),
  check (length(titular) between 5 and 500)
);

-- ─────────────────────────────────────────────
-- 2. Avances (noticias nuevas sobre el mismo tema)
-- ─────────────────────────────────────────────
create table if not exists public.seguimiento_avances (
  id              bigint generated always as identity primary key,
  seguimiento_id  bigint not null references public.seguimientos(id) on delete cascade,
  fecha           date not null,                        -- fecha de publicación del avance
  titular         text not null,
  url             text not null,
  fuente          text,
  edicion_numero  int,                                  -- N.º del Radar si también salió en el boletín
  creado_en       timestamptz not null default now(),
  unique (seguimiento_id, url)
);
create index if not exists seguimiento_avances_seg on public.seguimiento_avances (seguimiento_id, fecha);

-- Fecha de última modificación
create or replace function public.seguimientos_tocar() returns trigger language plpgsql as $$
begin new.actualizado_en := now(); return new; end $$;
drop trigger if exists seguimientos_tocar on public.seguimientos;
create trigger seguimientos_tocar before update on public.seguimientos
  for each row execute function public.seguimientos_tocar();

-- ─────────────────────────────────────────────
-- 3. Permisos
-- ─────────────────────────────────────────────
alter table public.seguimientos        enable row level security;
alter table public.seguimiento_avances enable row level security;

revoke all on public.seguimientos, public.seguimiento_avances from anon, authenticated;
grant select on public.seguimientos, public.seguimiento_avances to anon, authenticated;
grant insert (noticia_url, titular, pais, fuente, categoria, edicion_numero, edicion_fecha, semanas)
  on public.seguimientos to anon, authenticated;
grant update (semanas) on public.seguimientos to anon, authenticated;

drop policy if exists "lectura publica"   on public.seguimientos;
drop policy if exists "crear seguimiento" on public.seguimientos;
drop policy if exists "cambiar semanas"   on public.seguimientos;
drop policy if exists "lectura publica"   on public.seguimiento_avances;
create policy "lectura publica"   on public.seguimientos        for select to anon, authenticated using (true);
create policy "crear seguimiento" on public.seguimientos        for insert to anon, authenticated with check (semanas between 1 and 52);
create policy "cambiar semanas"   on public.seguimientos        for update to anon, authenticated using (true) with check (semanas between 1 and 52);
create policy "lectura publica"   on public.seguimiento_avances for select to anon, authenticated using (true);
