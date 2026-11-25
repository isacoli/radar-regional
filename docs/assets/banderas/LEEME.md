# Banderas en círculo

Íconos del «Resumen del día» por país (88 × 88 px, PNG con fondo transparente; se muestran a 22 px).

- `pe.png`, `co.png`, `ec.png`, `bo.png`, `ve.png`: de [circle-flags](https://github.com/HatScripts/circle-flags) v2.7.0 (HatScripts, licencia MIT), convertidas de SVG a PNG con `sips`.
- `regional.png`: globo propio (azul marino #003A70 con líneas #A7D8F0) para «Regional / Internacional».

Para otro país: descargar `flags/<iso>.svg` de circle-flags y convertir con
`sips -s format png -z 88 88 <iso>.svg --out <iso>.png`; luego añadirlo a `PAISES_RESUMEN` en `scripts/construir_boletin.py`.
