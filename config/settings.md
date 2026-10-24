# Radar settings

Edit this file to change how `/radar` works. Claude reads it at the start of every run.

## Frequency and window

- **Frequency:** daily, Monday to Friday, run manually with `/radar` at **07:00** (Lima/Bogotá/Quito time, UTC−5).
- **Time window** (all times UTC−5; Bolivia is UTC−4, so convert its timestamps):
  - **Tuesday–Friday:** from **07:01 the previous day to 07:00 the run day**. Example: the Friday 23 October issue covers Thursday 22 October 07:01 → Friday 23 October 07:00.
  - **Monday:** from **Friday 07:01 to Monday 07:00** (covers Friday after 07:00, the weekend, and early Monday).
  - The issue is dated with the run day.
  - Check each article's publication date **and time** on the page itself. A story published at 07:00 or earlier belongs to the previous issue. If a page shows only the date (no time), include it when the date is inside the window and note this in `notas.md`.
  - If `/radar` runs later than 07:00, keep the same window (ending 07:00 that day) so issues never overlap or leave gaps.
- **Planned change:** move to a scheduled cloud run from a GitHub repository later.

## Geography

1. **Core (priority):** Colombia, Perú, Bolivia, Ecuador.
2. **Region:** the rest of Latin America and the Caribbean — include when the story offers benchmarking, inspiration, a collaboration opportunity or a direct effect on the core countries.
3. **Outside the region:** only when the story is mainly about the region (e.g. Chinese, EU or US investment in South America).

## Languages

- **Search in:** Spanish, English, Portuguese.
- **Write in:** Spanish (headlines and daily summary).

## Volume

- **Target:** 20 headlines per issue.
- **Slow news days:** publish fewer rather than lowering quality. Never add a story that fails the trust rules (`config/sources.md`) or scores below 3 on relevance. State the count in the issue (e.g. "15 noticias").
- **Balance:** at least half of the stories from the core countries; no more than 6 from any single country; at least 4 different watchlist categories.

## Ranking and tags

Headlines are **ordered by popularity** (most widely covered first). Ties are broken by relevance.

- **Popularity** = how many distinct, independent trusted sources reported the story within the window. Copies of the same wire story (e.g. EFE republished by several outlets) count once. Real readership numbers are usually not public, so never invent them.
- **Relevance** = a 1–5 score against the rubric below.

| Tag | Rule |
|---|---|
| 🔥 **Más difundida** | The 5 stories with the highest popularity count (and at least 3 sources). |
| ⭐ **Más relevante** | The 5 stories with the highest relevance score (and a score of at least 4). Ties broken by popularity. |

A story can carry both tags, and many stories carry none.

### Highlighted cards ("Lo más destacado")

- 5 cards: the **top 3 by ranking** plus the **2 highest-ranked ⭐ stories not already included**. If there are fewer than 2 such ⭐ stories, fill with the next stories in the ranking.
- Each card adds one sentence on what happened. The other stories appear in the compact "Más titulares" list, numbered from 6.

### Relevance rubric (1–5)

- **5:** Directly concerns industrial development in a core country, or is a clear model or opportunity for the Andean office's work.
- **4:** Major regional development with a clear lesson or link for the core countries.
- **3:** Useful context on the regional economy, policy or infrastructure.
- **2 or lower:** not included in the daily issue.

## Review

Every issue is saved as a **draft** with the "BORRADOR" banner. The user reviews it and says when it is final; only then is the banner removed.
