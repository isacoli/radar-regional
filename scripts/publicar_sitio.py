#!/usr/bin/env python3
"""Publica una edición final en el sitio (carpeta docs/ de GitHub Pages).

Uso:
    python3 scripts/publicar_sitio.py output/radar/AAAA-MM-DD

- Toma el HTML final de la carpeta (`html_archivo` de datos.json), le agrega la barra de
  secciones del sitio (solo en la versión web, no en el correo) y lo copia a
  docs/index.html y docs/archivo/AAAA-MM-DD.html.
- Agrega la edición al principio de docs/archivo/index.html si no está.
- Pone la fecha y hora de esta edición (`ventana_fin`) bajo el botón "Actualizar noticias"
  de todas las páginas del sitio.
- No hace commit ni push: eso se hace después de la confirmación del usuario.
"""
import json
import re
import sys
from pathlib import Path

RAIZ = Path(__file__).resolve().parent.parent
BASE = "https://isacoli.github.io/radar-regional/"

BARRA = """  <!-- BARRA DEL SITIO (solo versión web) -->
  <tr><td style="background:#ffffff; border-bottom:1px solid #DCE6EF; padding:12px 26px; text-align:left; font-family:Arial, Helvetica, sans-serif;">
  {enlaces}
  </td></tr>
"""
SECCIONES = [("Inicio", ""), ("Mapa", "mapa/"), ("Financiamiento", "financiamiento/"), ("Buscador", "buscar/"),
             ("Investigación", "investigacion/"), ("Archivo", "archivo/")]
ACCION = "https://github.com/isacoli/radar-regional/actions/workflows/radar.yml"
MESES = ["ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic"]
ESTILO = ("display:inline-block; margin:3px; padding:7px 13px; border:1px solid #DCE6EF; border-radius:999px; "
          "font-size:13px; font-weight:bold; text-decoration:none; ")


def texto_actualizacion(ventana_fin):
    """'2026-10-26T02:21:00-05:00' -> 'Última actualización: 26 oct 2026, 02:21 (hora de Lima)'."""
    fecha, hora = ventana_fin[:10], ventana_fin[11:16]
    a, m, d = fecha.split("-")
    return f"Última actualización: {int(d)} {MESES[int(m) - 1]} {a}, {hora} (hora de Lima)"


def barra(activo="Inicio", actualizacion=""):
    enlaces = []
    for nombre, ruta in SECCIONES:
        if nombre == activo:
            est = ESTILO + "background:#003A70; color:#ffffff; border-color:#003A70;"
        else:
            est = ESTILO + "background:#EEF5FB; color:#003A70;"
        enlaces.append(f'<a href="{BASE}{ruta}" style="{est}">{nombre}</a>')
    enlaces.insert(0, f'<div class="act-editor" style="float:right; text-align:right; margin:3px;">'
                      f'<a href="{ACCION}" title="Solo equipo editor" style="{ESTILO}background:#ffffff; color:#6B7B8B; font-weight:normal; margin:0;">⟳ Actualizar noticias</a>'
                      f'<br><small class="ultima-act" style="font-size:10px; color:#6B7B8B;">{actualizacion}</small></div>')
    return BARRA.format(enlaces="\n  ".join(enlaces))


ESTILO_WEB = """<style id="estilo-sitio">
  /* Solo versión web: mismo ancho estándar que el resto del sitio (ver docs/assets/sitio.css) */
  .container { width:100% !important; max-width:1080px !important; }
  @media only screen and (max-width:1128px) { .container { max-width:calc(100% - 24px) !important; } }
  @media only screen and (max-width:620px) { .act-editor { float:none !important; text-align:left !important; } .container { max-width:100% !important; border-radius:0 !important; } body > table > tbody > tr > td { padding:0 !important; } }
</style>
"""


def con_estilo_web(html):
    """Agrega el ancho estándar del sitio a la copia web (el correo conserva sus 600 px)."""
    html = re.sub(r'<style id="estilo-sitio">.*?</style>\n', "", html, count=1, flags=re.S)
    return html.replace("</head>", ESTILO_WEB + "</head>", 1)


def con_barra(html, activo, actualizacion=""):
    """Inserta la barra justo debajo del banner (después de la franja de colores)."""
    html = re.sub(r"  <!-- BARRA DEL SITIO.*?</td></tr>\n", "", html, count=1, flags=re.S)
    html = re.sub(r"<!-- BARRA DEL SITIO.*?</div>\n", "", html, count=1, flags=re.S)  # versión anterior
    marca = "  <!-- RESUMEN DEL DÍA -->"
    if marca not in html:
        sys.exit("No se encontró el punto de inserción de la barra (RESUMEN DEL DÍA).")
    return html.replace(marca, barra(activo, actualizacion) + "\n" + marca, 1)


def poner_actualizacion(texto):
    """Escribe la hora de la última edición bajo el botón en todas las páginas de docs/."""
    for ruta in (RAIZ / "docs").rglob("*.html"):
        s = ruta.read_text(encoding="utf-8")
        nuevo = re.sub(r'(<small class="ultima-act"[^>]*>)[^<]*(</small>)', lambda m: m.group(1) + texto + m.group(2), s)
        if nuevo != s:
            ruta.write_text(nuevo, encoding="utf-8")


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    carpeta = Path(sys.argv[1])
    datos = json.loads((carpeta / "datos.json").read_text(encoding="utf-8"))
    ed = datos["edicion"]
    html = (carpeta / datos.get("html_archivo", "boletin.html")).read_text(encoding="utf-8")
    if "BORRADOR" in html:
        sys.exit("La edición todavía tiene el banner BORRADOR: márquela como final antes de publicarla.")
    fecha = ed["fecha"]
    act = texto_actualizacion(ed["ventana_fin"])
    (RAIZ / "docs" / "index.html").write_text(con_estilo_web(con_barra(html, "Inicio", act)), encoding="utf-8")
    (RAIZ / "docs" / "archivo" / f"{fecha}.html").write_text(con_estilo_web(con_barra(html, "Archivo", act)), encoding="utf-8")

    idx = RAIZ / "docs" / "archivo" / "index.html"
    s = idx.read_text(encoding="utf-8")
    if f'href="{fecha}.html"' not in s:
        n_n, n_i = len(datos["noticias"]), len(datos["investigaciones"])
        fila = (f'      <li><a href="{fecha}.html">N.º {ed["numero"]} · {ed.get("fecha_larga", fecha)}</a>'
                f'<br><span class="meta">{n_n} noticias · {n_i} investigaciones</span></li>\n')
        marca = "      <!-- EDICIONES: agregar cada nueva edición arriba -->\n"
        s = s.replace(marca, marca + fila, 1)
        idx.write_text(s, encoding="utf-8")
    poner_actualizacion(act)
    print(f"✓ Publicado en docs/: index.html y archivo/{fecha}.html · {act}")


if __name__ == "__main__":
    main()
