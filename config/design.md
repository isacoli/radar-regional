# Design settings

**Status:** design v2 approved on 2026-10-24; in use from the Monday 26 October 2026 issue onward. Colors remain provisional until official UNIDO codes are provided.

Visual rules for the daily bulletin (`templates/radar-diario.html`). Email HTML cannot use CSS variables, so these values are written inline in the template; change them here first, then in the template.

## Colors — PROVISIONAL (UNIDO-style approximation)

These are close to UNIDO's blue identity but **not the official brand codes**. Replace them when the official hex codes or brand guide are available.

| Token | Hex | Use |
|---|---|---|
| Navy | `#003A70` | Banner and footer background, main headings |
| Blue | `#0067B1` | Links, headline text, card accent border |
| Sky | `#009EDB` | Accents, summary box border, stripe |
| Light sky | `#5BC2E7` | Stripe |
| Pale sky | `#A7D8F0` | Stripe, banner subtitle |
| Tint | `#EEF5FB` | Summary box and card tag backgrounds |
| Teal | `#00818A` | "Investigación destacada" heading and labels |
| Ink | `#1F2D3A` | Body text |
| Muted | `#6B7B8B` | Source lines, notes |
| Line | `#DCE6EF` | Borders and dividers |
| Page | `#EEF2F6` | Email background around the 600px card |

Tags keep their own colors so they stand out: 🔥 Más difundida `#FDEBD8` on `#9A4A00`; ⭐ Más relevante `#E1EEFA` on `#003A70`.

## Banner (built-in, no image)

- Navy block with the office line, the large name "Radar Regional", the subtitle "Boletín diario de desarrollo industrial" and the issue line (number · date · counts).
- A five-color stripe underneath (navy → blue → sky → light sky → pale sky) as the graphic element; no image files, so it shows in every email program.
- To switch to a hosted photo later: replace the banner `<td>` background with an `<img>` that has an absolute `https://` URL, `width="600"`, and `alt` text.

## Layout

1. Banner and stripe
2. **Resumen del día** in a tinted box
3. Tag legend
4. **Lo más destacado:** 5 cards
5. **Más titulares:** the remaining headlines as a compact numbered list (numbering continues from 6)
6. **Investigación destacada**
7. Method note and footer

## Fonts

Email-safe only: Arial/Helvetica for text; Georgia for the large banner name and section numbers.

## Website width

- **Standard width for every site page: 1080 px** (`--ancho` in `docs/assets/sitio.css`), centered.
- **Tablet and small laptops (≤ 1128 px):** full width with 24 px side margins.
- **Phones (≤ 620 px):** full width, no margins.
- Issue pages keep 600 px in the email; their web copies get the same 1080 px width through `scripts/publicar_sitio.py`.
