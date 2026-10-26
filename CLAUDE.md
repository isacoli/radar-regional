# CLAUDE.md

This project produces news products for the UNIDO (ONUDI) Andean office, which covers Colombia, Perú, Bolivia and Ecuador.

There are two modes. **Never skip a step or a stop point in either.**

| Mode | Command | What it produces |
|---|---|---|
| 1. Daily Regional Radar (main) | `/radar` | Monday–Friday: scan → verify → rank → up to 20 headlines with a daily summary, plus up to 5 research publications, saved as a draft |
| 2. Topic deep dive | `/newsletter <topic>` | Clarifying questions → approved plan → researched long-form newsletter |

**Purpose of both:** benchmarking, regional inspiration and situational awareness — helping the team see what major regional players are doing and spot opportunities for cross-border collaboration or project replication.

## Key facts

- **Output language:** always Spanish. Sources may be in Spanish, English, Portuguese or other languages.
- **Format:** styled, email-ready HTML.
- **Core countries:** Colombia, Perú, Bolivia, Ecuador. News from the rest of Latin America and the Caribbean is welcome when relevant to them.
- **Talking to the user:** reply in the language the user writes in.
- **Configuration:** `config/supabase.json` (database URL and public read key), `config/publish.md` (website URL and publishing steps), `config/design.md` (colors, banner, layout), `config/settings.md` (frequency, window, volume, ranking, tags), `config/watchlist.md` (categories), `config/sources.md` (trusted-source levels and linking rule), `config/research.md` (research section: journals, working-paper series, window, tags). Always read them; they override defaults in this file.

---

## Mode 1 — Daily Regional Radar (`/radar`)

Monday to Friday, run manually for now (a scheduled run from GitHub is planned later). One run goes from scan to draft — there is no selection step.

**On-demand updates:** `/actualizar` (here) or the GitHub Actions workflow "Radar Regional — actualizar ahora" (`.github/workflows/radar.yml`, needs the `ANTHROPIC_API_KEY` repository secret; it opens a Pull Request with the draft). The window ends at the moment of the run and the next issue continues from there.

### Step 1 — Set up

1. Read the three config files and `output/radar/historial.md`.
2. Set the time window from `config/settings.md` (UTC−5): Tuesday–Friday, 07:01 the previous day → 07:00 the run day; Monday, Friday 07:01 → Monday 07:00. Check each article's publication time, not just its date.
3. Set the issue number: the number of the last daily issue in `historial.md` plus one. Numbering counts every weekday from N.º 1 = Thursday 1 October 2026 (19 Oct = N.º 13, 26 Oct = N.º 18); a back-dated issue takes the number of its weekday.

### Step 2 — Scan

- Search widely across every watchlist category and every core country, in Spanish, English and Portuguese. Run many searches (typically 30–40); do not stop at the first results.
- Search **Level 1 and Level 2 sources directly** (government press rooms, official agencies such as Andina and ABI, central banks, statistics offices, CEPAL, CAN, IDB, CAF, UNIDO), not only the media.
- Group results that report the same story. For each story, count the distinct, independent trusted sources (**popularity**); copies of one wire story count once.
- Drop stories already in `historial.md` unless there is a significant new development.

### Step 3 — Filter and verify

- Keep only stories from the trusted levels in `config/sources.md`. Level 4 sources need confirmation from another trusted source. Never use the "Never used" sources.
- Open every link: confirm it works, the publication date is inside the window, and the headline matches the article.
- Choose the link following the linking rule: the article itself on the publisher's site; the official source when it is an official announcement.
- Score relevance (1–5). Drop anything below 3.

### Step 4 — Rank and tag

- Order by popularity (most sources first), ties broken by relevance.
- Apply 🔥 **Más difundida** and ⭐ **Más relevante** following `config/settings.md`.
- Keep up to 20 stories, respecting the balance rules. On slow days publish fewer — never pad with weak or untrusted stories.

### Step 4b — Select research ("Investigación destacada")

Follow `config/research.md`:

- Search for papers published in the last 7 days (ending 07:00 on the run day) on the research topics: Q1 journals, the regional exceptions, and the five working-paper series (IDB, World Bank, CEPAL, UNIDO, NBER).
- Skip anything already in "Research featured" in `historial.md`.
- Verify each item: the DOI or official link resolves, the date is inside the window, and the journal's Q1 status is confirmed (record SJR or JCR, field and year) or the series is on the approved list. Read the abstract.
- Rank by relevance. On ties, put first the item most applicable to current regional issues (even a working paper), then journal standing, then recency. Keep up to 5, with at most 2 working papers. Publish fewer if fewer qualify; drop the section if none do.

### Step 5 — Build the draft

- Fill `templates/radar-diario.html` and save it as `output/radar/YYYY-MM-DD/boletin.html`.
- **Resumen del día:** one paragraph of 4–6 sentences at the top synthesizing the day — dominant themes, key figures, what to watch. Write it from the articles, in your own words.
- **Lo más destacado (5 cards):** the top 3 stories by ranking, plus the 2 highest-ranked ⭐ Más relevante stories not already among them (if fewer than 2 exist, take the next stories in the ranking). Order: the 3 by ranking, then the 2 ⭐. Each card shows its number, tags, the Spanish headline linked to the original article, **one sentence on what happened** (own words, from the article), and source · country · category.
- **Más titulares:** every other story in ranking order, numbered from 6, with headline linked to the original article and source · country · category (plus original language and `[pago]` if relevant). No summary.
- Follow `config/design.md` for colors and layout (provisional UNIDO-style palette until official codes are provided).
- **Investigación destacada** (after the headlines): for each item, tags (⭐ if relevance 5, Regional/Global, Acceso abierto/[pago], Documento de trabajo if applicable), Spanish title linked to the DOI, original title in small italics underneath (omit if already Spanish), first author *et al.* · journal or series · year, and one "Hallazgo principal" sentence in Spanish written from the abstract. Remove the section if there are no items.
- Keep the "BORRADOR" banner. Remove every `{{MARCADOR}}`.
- Save working notes in `output/radar/YYYY-MM-DD/notas.md` using `templates/notas.md`: the full ranking with source counts, discarded stories and why, conflicts and coverage.
- Save the structured data in `output/radar/YYYY-MM-DD/datos.json` (same format as `output/radar/2026-10-23-diario/datos.json`): `edicion` (slug `diario-AAAA-MM-DD`, tipo, numero, fecha, ventana, titulo, resumen, url_web), `html_archivo`, and the full lists of `noticias` and `investigaciones` with every field (position, card flag, headline, one-liner, URL, source, country, category, tags, coverage, relevance, publication date; for research: titles, authors, journal, type, scope, access, finding, DOI, date, ranking check).

### Step 6 — Log and hand off

- Add the issue to "Daily issues", every published story to "Stories published" and every research item to "Research featured" in `historial.md`.
- Open `boletin.html` in the browser pane and give a short summary in chat: number of stories, the top headlines, and anything flagged in the notes.
- Wait for the user's review. When the user says the issue is final, remove the "BORRADOR" banner and mark the issue as final in `historial.md`.

### Step 7 — Publish to the website (GitHub Pages)

Follow `config/publish.md`: build the final issue with `python3 scripts/construir_boletin.py output/radar/AAAA-MM-DD --final`, then run `python3 scripts/publicar_sitio.py output/radar/AAAA-MM-DD` (copies it to `docs/index.html` and `docs/archivo/`, adds the site section bar below the banner on the web copies only, updates the archive list, and writes the issue's `ventana_fin` as "Última actualización: …" under the "⟳ Actualizar noticias" button on every page). The archive page (`docs/archivo/`) must always list **every published issue**: the script rebuilds the full list from all final daily issues on each run (newest first, with number, date and counts), so renumbered or corrected issues are reflected too; to refresh only the list, run `python3 scripts/publicar_sitio.py --archivo`. Then update the map (below) and commit.

**Map (`docs/mapa/paises.json`):** after each final issue, update the card of **all 17 continental countries** (México → Argentina); no country is left without a card. Three bullets:
1. **Noticia principal del día:** the country's most important story (highest coverage, then relevance) **inside the issue's window** (07:01 the previous day → 07:00; or the on-demand cut-off). Search every country daily, not only the stories that made the issue — a story outside the issue is valid if it comes from a trusted source. If the country has no story in the window, use its **most recent** trusted story and show its date. One sentence of **at most 30 words**, with source, date and link, and `en_boletin` true/false.
2. **Financiamiento:** the **latest financing operation of the last 30 days** for the country (multilateral, bilateral, national development bank, government or private investment), taken from `docs/financiamiento/operaciones.json` or a new verified search: institution, amount, date and link. If there is none in 30 days, say so.
3. **Oportunidades para la ONUDI:** rewritten **every day** from bullets 1 and 2 only (an orientative analysis, not an official position; never invent programmes).
Update `actualizado`, `ventana` and `fuente`.

**Financing (`docs/financiamiento/operaciones.json`):** keep a rolling **30-day** list of the most recent financing operations in the 17 continental countries (México → Argentina): multilateral (BID, CAF, Banco Mundial, BCIE, FONPLATA…), bilateral cooperation (UE, GIZ/KfW, AFD, JICA…), national development banks, governments and private investment. For each: `fecha`, `pais`, `iso`, `institucion`, `tipo_institucion`, `publico_privado` (Público/Privado), `monto_usd_millones` (only when the source gives US$ or a conversion; otherwise `null`, and it shows in the table only), `monto_original`, `sector` (one of the nine in the page), `descripcion`, `fuente`, `url` (verified), `nota` (e.g. "anunciado, no desembolsado", "pendiente de aprobación legislativa"). Drop operations older than 30 days, never invent amounts, and search for new approvals at least weekly (Monday issue). **Push only after the user confirms**, since pushing publishes it on the public site. Never publish drafts.

### Step 8 — Save to the database (Supabase)

After publishing, load the final issue into Supabase so it is searchable:

```bash
python3 scripts/supabase_cargar.py output/radar/AAAA-MM-DD
```

It reads `datos.json` and the HTML, and needs `.env` with `SUPABASE_URL` and `SUPABASE_SERVICE_ROLE_KEY` (the user creates `.env`; never print, copy or commit the secret key). Re-running replaces the issue without duplicates. Only final issues go into the database.

## Answering questions about past issues

When the user asks about past news or research (e.g. "¿qué noticias de litio hubo en noviembre?"), query the database with the public read-only key:

```bash
python3 scripts/supabase_consultar.py "litio" --pais Bolivia --desde 2026-11-01 --hasta 2026-11-30
```

Options: `--tipo noticias|investigaciones|ambos`, `--categoria`, `--limite`. Answer with the matching headlines, dates and links; the public search page is at `docs/buscar/` (`https://isacoli.github.io/radar-regional/buscar/`). Schema: `supabase/schema.sql`.

---

## Mode 2 — Topic deep dive (`/newsletter <topic>`)

### Stage 1 — Clarifying questions (then STOP)

Ask concise questions about:

1. **Scope:** countries, sectors and time period.
2. **Audience:** internal staff, government counterparts, donors/partners, private sector or the general public.
3. **Depth:** short briefing (~400 words), standard issue (~800–1,200 words) or deep dive (~1,500–2,500 words).
4. **Extras:** tone, deadline, must-include sources, projects or events, and anything to avoid.

Wait for the answers. Skip only the questions already answered.

### Stage 2 — Written plan (then STOP for approval)

Save to `output/YYYY-MM-DD-<topic-slug>/plan.md`: the angle and 3–5 key questions, a section outline with word counts mapped to the template, sources to consult and search languages, and the deliverable paths. Ask for approval. **Do not research until the user explicitly approves.** Revise and ask again if they request changes.

### Stage 3 — Research

Prefer Level 1 and Level 2 sources (see `config/sources.md`). Record source, publisher, date and URL for every figure and claim. Flag outdated data, conflicting figures, gaps and anything unverified.

### Stage 4 — Organize and write

- Fill `templates/newsletter.html` and save as `output/YYYY-MM-DD-<topic-slug>/boletin.html`.
- Clear, neutral, professional Spanish (Latin American usage, `usted` register).
- Use numbered citations `[1]` linking to "Fuentes".
- Delete unused optional sections and all `{{PLACEHOLDER}}` markers.
- Also save `fuentes.md` with the full source list and research notes.

### Stage 5 — Hand off

Summarize in chat (headline, sections, items to check), then open `boletin.html` in the browser pane.

---

## Other templates

- `templates/radar.html` and `templates/candidatos.md`: the earlier weekly format (summaries plus team selection). Kept as a backup; not used by `/radar`.
- `templates/radar-diario-v1.html`: the first daily design (single ranked list). Kept as a backup.

## Writing rules (both modes)

- Translate non-Spanish headlines and material into Spanish. Mark translated quotes as `(traducción propia)` and note the original language.
- Summaries are short and in your own words — never copy article text. Only include facts the original articles state.
- **Links** always go to the article itself on the publisher's own site (or the official page for announcements and reports): never to a home page, search result, Google News, an aggregator or a redirect. If several outlets covered the same story, link the most authoritative one, preferring an official source, then an open Spanish-language source.

## Email HTML rules

- Table-based layout, 600px max width, all CSS **inline** (the `<style>` block in the templates is only progressive enhancement).
- No JavaScript, no web fonts, no external CSS, no forms, no video.
- Images only with an absolute `https://` URL, `alt` text and explicit width.
- Keep the hidden preheader text current.

## Guardrails

- Never invent stories, quotes, figures, links, readership numbers, people or events. If something cannot be verified, leave it out.
- Every link must be opened and checked before it is published. If a site blocks verification, use another trusted source for the same story or leave it out.
- Keep the "BORRADOR" banner until the user says the issue is final. Drafts do not speak for UNIDO officially.
- Do not add the UNIDO logo or other logos unless the user provides the image file or an approved URL.
- When stopping for questions, approval or review, really stop: end the turn and wait.
