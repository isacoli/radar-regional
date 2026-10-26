---
description: Actualización a pedido del Radar Regional (noticias hasta este momento)
argument-hint: [instrucciones opcionales]
---

Run an ON-DEMAND update of the Daily Regional Radar (Mode 1 in CLAUDE.md).

Extra instructions, if any: $ARGUMENTS

1. First tell the user when the last search ran: the last issue in `output/radar/historial.md` (number, date, window end) and the current time in Lima (`TZ=America/Lima date`).
2. Set the window from just after the last issue's window end to **now** (on-demand rule in `config/settings.md`).
3. Follow Mode 1 steps 2–6 exactly: scan, verify every link and publication time, rank and tag, select research, write `datos.json` and `notas.md`, build the draft with `python3 scripts/construir_boletin.py output/radar/AAAA-MM-DD`, log it as a draft in `historial.md`, preview it, and wait for the user's review.
