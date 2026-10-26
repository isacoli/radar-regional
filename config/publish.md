# Publishing settings (GitHub Pages)

- **Site URL (`{{URL_SITIO}}`):** `https://isacoli.github.io/radar-regional/` (always end with `/`).
- **Repository:** `https://github.com/isacoli/radar-regional` (public)
- **Pages source:** branch `main`, folder `/docs`.

## Site structure

| File | Content |
|---|---|
| `docs/index.html` | Always the latest **final** issue (what the button opens) |
| `docs/archivo/AAAA-MM-DD.html` | One copy per final issue |
| `docs/archivo/index.html` | List of all issues, newest first |
| `docs/.nojekyll` | Tells GitHub Pages to serve the files as they are |

## Publishing step (after the user marks an issue final)

1. Replace `{{URL_SITIO}}` in the issue with the site URL above (the button and footer links).
2. Copy the final issue to `docs/archivo/AAAA-MM-DD.html` and to `docs/index.html`.
3. Rebuild the full list in `docs/archivo/index.html` (every published daily issue, newest first). `publicar_sitio.py` does this on every run; `--archivo` refreshes only the list.
4. Commit with a message like `Radar Regional N.º X — AAAA-MM-DD`.
5. Push to `main` only after the user confirms (a push publishes the issue on the public website).

Drafts (with the "BORRADOR" banner) are never copied to `docs/`.

## Database (Supabase)

- **Project:** `https://mibponspfvjtkvsrmzag.supabase.co`
- **Schema:** `supabase/schema.sql` (tables `ediciones`, `noticias`, `investigaciones`; views `noticias_con_edicion`, `investigaciones_con_edicion`; public read, write only with the secret key)
- **Load an issue:** `python3 scripts/supabase_cargar.py output/radar/AAAA-MM-DD` (needs `.env` with `SUPABASE_URL` and `SUPABASE_SERVICE_ROLE_KEY`)
- **Search page:** `docs/buscar/index.html` → `https://isacoli.github.io/radar-regional/buscar/` (uses the public anon key)
