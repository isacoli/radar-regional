# Research settings — "Investigación destacada"

Edit this file to change how `/radar` selects research. Claude reads it at the start of every run.

## Volume and window

- **Up to 5 items per daily issue.** Publish fewer when fewer meet the bar; leave the section out if none do.
- **Window:** published (or posted online as an accepted/early-view article) in the **last 7 days**, ending 07:00 (UTC−5) on the run day.
- **Never repeat** an item already in the "Research featured" table of `output/radar/historial.md`.
- **Mix:** at most **2 working papers** per issue, so peer-reviewed articles stay the core.

## Topics

The same as `config/watchlist.md`, with emphasis on:

- Industrial policy, structural change, productivity and manufacturing
- Innovation, technology adoption, digitalization and AI in firms
- Energy transition, green industry, decarbonization and circular economy
- Critical minerals, value addition and resource-based industrialization
- Global value chains, trade, foreign direct investment and special economic zones
- MSMEs, informality, skills and industrial employment

## Geography

1. **Regional first:** papers on the Andean countries (Colombia, Perú, Bolivia, Ecuador) or Latin America and the Caribbean.
2. **Global:** include when findings clearly apply to the Andean office's work (e.g. major cross-country evidence on industrial policy or green industry).

Tag each item **Regional** or **Global**.

## Quality bar

### Peer-reviewed journals

Only journals in the **top quartile (Q1)** of their field in Scimago (SJR) or JCR. Check the ranking each time; do not assume. Examples:

- **Development and economics:** World Development, Journal of Development Economics, World Bank Economic Review, Journal of Development Studies, Economic Development and Cultural Change, Review of Economics and Statistics, Journal of International Economics
- **Industry, innovation and structural change:** Research Policy, Industrial and Corporate Change, Structural Change and Economic Dynamics, Technological Forecasting and Social Change, Journal of Economic Geography, Small Business Economics
- **Energy, environment and resources:** Energy Policy, Energy Economics, Nature Energy, Nature Sustainability, Journal of Cleaner Production, Resources Policy, Ecological Economics, Resources, Conservation and Recycling
- **Trade and value chains:** Review of International Political Economy, Journal of International Business Studies, World Economy

**Regional exceptions** (allowed even if not Q1, when highly relevant to the Andean countries): CEPAL Review / Revista de la CEPAL, Latin American Economic Review, Journal of Latin American Studies, Latin American Research Review, El Trimestre Económico, Desarrollo y Sociedad, Revista de Economía Institucional.

**Never:** predatory or unranked journals, conference abstracts, preprints without a recognized publisher.

### Flagship working papers (labeled "Documento de trabajo")

Accepted from these series only:

- **IDB / BID:** IDB Working Paper Series, Technical Notes, Policy Briefs (publications.iadb.org)
- **World Bank:** Policy Research Working Papers (documents.worldbank.org / openknowledge.worldbank.org)
- **CEPAL / ECLAC:** Documentos de Proyectos, Serie Desarrollo Productivo, Libros y documentos institucionales (repositorio.cepal.org)
- **UNIDO / ONUDI:** Industrial Analytics Platform, Working Papers, Industrial Development Report (unido.org, iap.unido.org)
- **NBER:** NBER Working Papers (nber.org)

## Ranking and tags

- Order by **relevance (1–5)**.
- **When relevance ties**, rank first the item most applicable to **current regional issues**, even if it is a working paper. Current issues are the themes dominating that day's headlines and the recent history (e.g. El Niño, energy supply, trade tariffs, investment climate). Record in `notas.md` which issue each item connects to.
- If still tied: journal standing (Q1 journal above regional exception above working paper), then most recent first.
- ⭐ **Más relevante:** items with relevance 5. No 🔥 tag for research.
- Other tags: **Regional / Global** · **Acceso abierto** or **[pago]** · **Documento de trabajo** (for working papers).

## Each entry shows

1. Tags
2. **Spanish title** (translated), linked to the DOI page (`https://doi.org/...`) or, for working papers without a DOI, the official series page
3. **Original title** under it, in small text (only when the original is not in Spanish)
4. First author *et al.* · journal or series · year
5. **Hallazgo principal:** one sentence in Spanish, in your own words, on the main finding — written from the abstract, never from guesswork

## Verification

For every item:

- The DOI or official link resolves to the paper
- The publication date (online or issue) is inside the 7-day window
- The journal is Q1 (record the source: SJR or JCR, field, year), is on the regional exceptions list, or the series is on the working-paper list
- The finding sentence matches the abstract
- Search tools: journal tables of contents, Crossref and OpenAlex (by date and topic), Google Scholar, and the working-paper series sites above
