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

## Banner (photo, approved 2026-10-26)

- Navy block with the office line, the large name "Radar Regional", the subtitle "Boletín diario de desarrollo industrial" and the issue line (number · date · counts), over a photo with a navy gradient (solid on the left where the text is, lighter on the right).
- A five-color stripe underneath (navy → blue → sky → light sky → pale sky).
- **Photos** (freely licensed, copies in `docs/assets/banner/`, cropped to 1600×600; the credit must always be shown):

| Order | File | Photo | Credit |
|---|---|---|---|
| 1 | `paranal-armazones-chile.jpg` | Planta fotovoltaica Paranal-Armazones, Chile | ESO · CC BY 4.0 |
| 2 | `jepirachi-colombia.jpg` | Parque eólico Jepírachi, Colombia | Taggen · CC BY-SA 4.0 |
| 3 | `marangani-peru.jpg` | Fábrica textil de Marangani, Perú | Uriel Caballero Quispitupa · CC BY-SA 4.0 |
| 4 | `hortolandia-brasil.jpg` | Planta de reciclaje de Hortolândia, Brasil | Ana Perugini · CC BY 2.0 |

- **Website:** `docs/assets/banner.js` rotates the photos every 7 seconds in the banner only (cross-fade with a slow zoom; dots to jump; pauses on hover and in background tabs; still photo if the visitor prefers reduced motion). Credit shown on the banner. Section pages load it directly; `publicar_sitio.py` adds it to the web copies of the issues. To change photos, edit `FOTOS` in `banner.js` and this table.
- **Email:** no carousel (no JavaScript in email). The banner uses photo 1 as a fixed background with the gradient; clients that do not support it show plain navy. Credit in the footer.

## Layout

1. Banner and stripe
2. **Resumen del día** by country (design C1, approved 25 Nov 2026): a two-column grid of pastel boxes, one per country in the order Perú, Colombia, Ecuador, Bolivia, Venezuela, then "Regional / Internacional" across the full width (an odd last country also goes full width). Each box: 22 px round flag, country name in bold, about half of the text (165 characters; 250 in full-width boxes, cut at a whole word) and a small bold "más ›" (`#0067B1`). In email, "más" links to the web copy (`#resumen-<país>`); on the website it opens the rest of the text in the box (`docs/assets/resumen.js`). On phones (≤ 620 px) the columns stack where the client allows it.

   | Country | Background | Flag file |
   |---|---|---|
   | Perú | `#FDECEC` (soft red) | `pe.png` |
   | Colombia | `#FFF5D6` (soft yellow) | `co.png` |
   | Ecuador | `#E6F1FB` (soft blue) | `ec.png` |
   | Bolivia | `#E7F5EA` (soft green) | `bo.png` |
   | Venezuela | `#F0EAF8` (soft lavender) | `ve.png` |
   | Regional / Internacional | `#EEF1F4` (grey) | `regional.png` (navy globe) |

   Flags: `docs/assets/banderas/` (88 px PNG, circle-flags, MIT; see its `LEEME.md`), linked with absolute `https://` URLs. Outlook for Windows shows them square.
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
