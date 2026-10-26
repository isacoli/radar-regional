#!/usr/bin/env python3
"""Construye el boletín diario (HTML) a partir de datos.json y la plantilla v2.

Uso:
    python3 scripts/construir_boletin.py output/radar/AAAA-MM-DD [--final]

Lee `datos.json` de la carpeta y `templates/radar-diario.html`, y escribe `boletin.html`.
Sin `--final` mantiene el banner «BORRADOR»; con `--final` lo quita.

Campos extra de `datos.json` que usa este script (además de los de la base de datos):
  edicion.preheader, edicion.fecha_larga ("Lunes 26 de octubre de 2026"),
  edicion.ventana_texto_inicio ("viernes 23 de octubre, 07:01"),
  edicion.ventana_texto_fin ("lunes 26 de octubre de 2026, 02:21")
Las noticias con "destacada": true van como tarjetas (en el orden de la lista), el resto en «Más titulares».
"""
import json
import re
import sys
from pathlib import Path

RAIZ = Path(__file__).resolve().parent.parent
CONF_URL = "https://isacoli.github.io/radar-regional/"

D = '<span style="background-color:#FDEBD8; color:#9A4A00; padding:1px 6px; border-radius:3px; font-weight:bold;">🔥 Más difundida</span>'
R = '<span style="background-color:#E1EEFA; color:#003A70; padding:1px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>'
Ds = D.replace("padding:1px 6px", "padding:1px 5px")
Rs = R.replace("padding:1px 6px", "padding:1px 5px")
G = lambda x: f'<span style="background-color:#EEF1F4; color:#4A5A6A; padding:1px 6px; border-radius:3px;">{x}</span>'
REG = lambda x: f'<span style="background-color:#E0F2F3; color:#00666D; padding:1px 6px; border-radius:3px; font-weight:bold;">{x}</span>'


def bloque(tpl, inicio, fin):
    s = tpl.index(f"      <!-- {inicio}")
    e = tpl.index(f"      <!-- {fin} -->") + len(f"      <!-- {fin} -->\n")
    return s, e, tpl[s:e]


def limpiar_comentarios(b):
    return re.sub(r"      <!-- [^\n]*-->\n", "", b)


def etiquetas(n, small=False):
    t = []
    if n.get("mas_difundida"):
        t.append(Ds if small else D)
    if n.get("mas_relevante"):
        t.append(Rs if small else R)
    return t


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    carpeta = Path(sys.argv[1])
    final = "--final" in sys.argv
    datos = json.loads((carpeta / "datos.json").read_text(encoding="utf-8"))
    ed = datos["edicion"]
    tpl = (RAIZ / "templates" / "radar-diario.html").read_text(encoding="utf-8")

    cs, ce, card = bloque(tpl, "TARJETA", "FIN TARJETA")
    ls, le, item = bloque(tpl, "TITULAR (REPETIBLE)", "FIN TITULAR")
    ps, pe, pub = bloque(tpl, "PUBLICACIÓN", "FIN PUBLICACIÓN")
    tag_card = re.search(r'\n            <div style="font-size:11px; line-height:16px; padding-bottom:6px;">.*?</div>', card, re.S).group(0)
    tag_list = re.search(r'\n            <!-- Etiquetas: solo si aplican.*?</div>', item, re.S).group(0)
    tag_pub = re.search(r'\n            <div style="font-size:11px; line-height:16px; padding-bottom:4px;">.*?</div>', pub, re.S).group(0)

    destacadas = [n for n in datos["noticias"] if n.get("destacada")]
    resto = [n for n in datos["noticias"] if not n.get("destacada")]

    html_cards = []
    for i, n in enumerate(destacadas, 1):
        b = limpiar_comentarios(card)
        tg = etiquetas(n)
        b = b.replace(tag_card, ('\n            <div style="font-size:11px; line-height:16px; padding-bottom:6px;">\n              ' + "\n              ".join(tg) + '\n            </div>') if tg else "")
        if i == 1:
            b = b.replace("margin-top:12px;", "margin-top:10px;")
        for k, v in {"{{N}}": str(i), "{{URL DEL ARTÍCULO ORIGINAL}}": n["url"], "{{TITULAR EN ESPAÑOL}}": n["titular"],
                     "{{UNA FRASE sobre qué pasó, con palabras propias}}": n.get("resumen") or "",
                     "{{FUENTE}}": n["fuente"], "{{PAÍS}}": n["pais"], "{{CATEGORÍA}}": n["categoria"]}.items():
            b = b.replace(k, v)
        html_cards.append(b)

    html_list = []
    for i, n in enumerate(resto, len(destacadas) + 1):
        b = limpiar_comentarios(item)
        tg = etiquetas(n, small=True)
        b = b.replace(tag_list, ('\n            <div style="font-size:10px; line-height:15px; padding-bottom:3px;">\n              ' + "\n              ".join(tg) + '\n            </div>') if tg else "")
        for k, v in {"{{N}}": str(i), "{{URL DEL ARTÍCULO ORIGINAL}}": n["url"], "{{TITULAR EN ESPAÑOL}}": n["titular"],
                     "{{FUENTE}}": n["fuente"], "{{PAÍS}}": n["pais"], "{{CATEGORÍA}}": n["categoria"]}.items():
            b = b.replace(k, v)
        html_list.append(b)

    html_pubs = []
    for i, p in enumerate(datos["investigaciones"], 1):
        b = limpiar_comentarios(pub)
        tg = ([R] if p.get("mas_relevante") else []) + [REG(p["ambito"]), G("Acceso abierto" if p.get("acceso_abierto") else "[pago]")]
        if p.get("tipo") == "documento_de_trabajo":
            tg.append(G("Documento de trabajo"))
        b = b.replace(tag_pub, '\n            <div style="font-size:11px; line-height:16px; padding-bottom:4px;">\n              ' + "\n              ".join(tg) + '\n            </div>')
        b = b.replace("{{Primer autor}} et al.", p["autores"])
        orig = p.get("titulo_original") or ""
        if not orig or orig == p["titulo_es"]:
            b = re.sub(r'\n            <div style="font-size:11px; line-height:15px; color:#8A98A6; font-style:italic; padding-top:2px;">\{\{Título original[^<]*</div>', "", b)
        for k, v in {"{{N}}": str(i), "{{https://doi.org/...}}": p["url"], "{{TÍTULO EN ESPAÑOL}}": p["titulo_es"],
                     "{{Título original (omitir si ya está en español)}}": orig, "{{Revista o serie}}": p["revista"],
                     "{{Año}}": (p.get("fecha_publicacion") or ed["fecha"])[:4],
                     "{{Una frase en español a partir del resumen}}": p["hallazgo"]}.items():
            b = b.replace(k, v)
        html_pubs.append(b)

    out = tpl[:cs] + "\n".join(html_cards) + tpl[ce:ls] + "\n".join(html_list) + tpl[le:ps] + "\n".join(html_pubs) + tpl[pe:]
    if not html_pubs:
        out = re.sub(r"  <!-- INVESTIGACIÓN DESTACADA.*?  </tr>\n\n", "", out, flags=re.S)
    out = re.sub(r"<!--\n  PLANTILLA.*?-->\n", "", out, flags=re.S)
    reemplazos = {
        "{{DÍA DD MES AÑO}}": ed["fecha_larga"],
        "{{PREHEADER: los 2–3 titulares principales del día en una frase}}": ed["preheader"],
        "{{NÚMERO}}": str(ed["numero"]),
        "{{Día DD de mes de AAAA}} · {{N}} noticias · {{N}} investigaciones":
            f'{ed["fecha_larga"]} · {len(datos["noticias"])} noticias · {len(datos["investigaciones"])} investigaciones',
        "{{RESUMEN: un párrafo de 4–6 frases, en español y con palabras propias, que sintetice lo más importante del día en la región}}": ed["resumen"],
        "{{día DD de mes, 07:01}}": ed["ventana_texto_inicio"],
        "{{día DD de mes, 07:00}}": ed["ventana_texto_fin"],
        "{{URL_SITIO}}": CONF_URL,
    }
    for k, v in reemplazos.items():
        out = out.replace(k, v)
    if final:
        out = re.sub(r"  <!-- BANNER DE BORRADOR.*?</tr>\n\n", "", out, count=1, flags=re.S)
    pendientes = re.findall(r"\{\{[^}]*\}\}", out)
    if pendientes:
        sys.exit(f"Marcadores sin reemplazar: {pendientes[:5]}")
    destino = carpeta / datos.get("html_archivo", "boletin.html")
    destino.write_text(out, encoding="utf-8")
    print(f"✓ {destino} ({len(destacadas)} tarjetas, {len(resto)} titulares, {len(html_pubs)} investigaciones{', final' if final else ', borrador'})")


if __name__ == "__main__":
    main()
