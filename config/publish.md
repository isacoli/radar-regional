# Publishing settings (GitHub Pages)

- **Site URL (`{{URL_SITIO}}`):** `PENDIENTE` — set to `https://<cuenta>.github.io/<repositorio>/` once the repository exists. Always end with `/`.
- **Repository:** `PENDIENTE`
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
3. Add a row at the top of the list in `docs/archivo/index.html`.
4. Commit with a message like `Radar Regional N.º X — AAAA-MM-DD`.
5. Push to `main` only after the user confirms (a push publishes the issue on the public website).

Drafts (with the "BORRADOR" banner) are never copied to `docs/`.
