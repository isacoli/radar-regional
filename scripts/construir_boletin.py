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

Resumen del día por país (desde el N.º 40): edicion.resumen_paises = [{"pais": "Perú", "texto": "..."}, ...],
con países de PAISES_RESUMEN (Perú, Colombia, Ecuador, Bolivia, Venezuela, "Regional / Internacional").
Cada caja muestra la mitad del texto y «más ›» (en el correo enlaza a la web; en la web despliega el texto,
docs/assets/resumen.js). Si falta edicion.resumen, se arma uniendo los textos por país. Sin resumen_paises
se usa el párrafo único de antes.
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
S = '<span style="background-color:#E7F5EA; color:#2E7D3E; padding:1px 6px; border-radius:3px; font-weight:bold;">🔁 En seguimiento</span>'
Ss = S.replace("padding:1px 6px", "padding:1px 5px")
LEYENDA_SEG = ('&nbsp;&nbsp;\n      <span style="background-color:#E7F5EA; color:#2E7D3E; padding:2px 6px; border-radius:3px; font-weight:bold;">'
               '🔁 En seguimiento</span>&nbsp;novedad de un tema que el equipo sigue')
REG = lambda x: f'<span style="background-color:#E0F2F3; color:#00666D; padding:1px 6px; border-radius:3px; font-weight:bold;">{x}</span>'


# Resumen del día por país (diseño C1, aprobado el 25 nov 2026). Orden fijo; un país sin noticias no lleva caja.
# (nombre en datos.json, ancla, archivo de bandera en docs/assets/banderas/, fondo pastel)
PAISES_RESUMEN = [
    ("Perú", "peru", "pe", "#FDECEC"),
    ("Colombia", "colombia", "co", "#FFF5D6"),
    ("Ecuador", "ecuador", "ec", "#E6F1FB"),
    ("Bolivia", "bolivia", "bo", "#E7F5EA"),
    ("Venezuela", "venezuela", "ve", "#F0EAF8"),
    ("Regional / Internacional", "regional", "regional", "#EEF1F4"),
]
CORTE_MEDIA, CORTE_ANCHA = 165, 250  # caracteres visibles: caja de media columna / de ancho completo
MAS = "font-size:12px; font-weight:bold; color:#0067B1; text-decoration:none; white-space:nowrap;"


def esc(t):
    return t.replace("&", "&amp;").replace('"', "&quot;").replace("<", "&lt;").replace(">", "&gt;")


def marca_noticia(b, n, pos):
    """Datos de la noticia en el enlace del titular (los usa el botón «Seguir» de la web; el correo los ignora)."""
    datos = (f'class="rr-noticia" data-pos="{pos}" data-pais="{esc(n.get("pais") or "")}" '
             f'data-fuente="{esc(n.get("fuente") or "")}" data-categoria="{esc(n.get("categoria") or "")}" ')
    return b.replace('<a href="{{URL DEL ARTÍCULO ORIGINAL}}"', '<a ' + datos + 'href="{{URL DEL ARTÍCULO ORIGINAL}}"', 1)


def cortar(t, n):
    """Primera mitad visible (cortada en una palabra completa) y el resto, sin perder la puntuación."""
    if len(t) <= n + 20:
        return t, ""
    i = t.rfind(" ", 0, n)
    a = t[:i].rstrip(" ,;:.")
    return a, t[len(a):]


def caja_pais(nombre, ancla, bandera, fondo, texto, n, url_web):
    corto, resto = cortar(texto, n)
    if resto:
        cola = (f'<span class="rp-puntos">…</span> <a class="rp-mas" href="{url_web}#resumen-{ancla}" data-resto="{esc(resto)}" '
                f'style="{MAS}">más ›</a>')
    else:
        cola = ""
    img = (f'<img src="{CONF_URL}assets/banderas/{bandera}.png" width="22" height="22" alt="Bandera de {nombre}" '
           f'style="display:block; width:22px; height:22px; border:0; border-radius:50%;">')
    if bandera == "regional":
        img = img.replace(f'alt="Bandera de {nombre}"', 'alt="Globo terráqueo"')
    return (f'<table role="presentation" id="resumen-{ancla}" width="100%" height="100%" cellpadding="0" cellspacing="0" border="0" '
            f'style="height:100%; background-color:{fondo}; border-radius:8px;"><tr><td valign="top" style="padding:12px 14px; '
            f'font-family:Arial, Helvetica, sans-serif; font-size:13px; line-height:19px; color:#1F2D3A;">'
            f'<table role="presentation" cellpadding="0" cellspacing="0" border="0"><tr>'
            f'<td valign="middle" style="padding-right:8px;">{img}</td>'
            f'<td valign="middle" style="font-size:14px; line-height:20px; font-weight:bold; color:#1F2D3A;">{nombre}:</td></tr></table>'
            f'<div class="rp-texto" style="padding-top:6px;">{esc(corto)}{cola}</div></td></tr></table>')


def resumen_paises(ed, url_web):
    """Cuadrícula de dos columnas: países de dos en dos; el último país impar y Regional van a lo ancho."""
    textos = {r["pais"]: r["texto"].strip() for r in ed["resumen_paises"] if r.get("texto", "").strip()}
    desconocidos = set(textos) - {p[0] for p in PAISES_RESUMEN}
    if desconocidos:
        sys.exit(f"resumen_paises: países no previstos {sorted(desconocidos)} (use {[p[0] for p in PAISES_RESUMEN]})")
    paises = [p for p in PAISES_RESUMEN[:-1] if p[0] in textos]
    regional = PAISES_RESUMEN[-1] if PAISES_RESUMEN[-1][0] in textos else None
    filas = []
    for i in range(0, len(paises), 2):
        par = paises[i:i + 2]
        if len(par) == 2:
            celdas = "".join(f'<td class="rp-col" width="50%" valign="top" style="padding:5px; height:1px;">'
                             f'{caja_pais(*p, textos[p[0]], CORTE_MEDIA, url_web)}</td>' for p in par)
        else:
            celdas = f'<td colspan="2" valign="top" style="padding:5px;">{caja_pais(*par[0], textos[par[0][0]], CORTE_ANCHA, url_web)}</td>'
        filas.append(f"<tr>{celdas}</tr>")
    if regional:
        filas.append(f'<tr><td colspan="2" valign="top" style="padding:5px;">{caja_pais(*regional, textos[regional[0]], CORTE_ANCHA, url_web)}</td></tr>')
    return ('      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">\n        '
            + "\n        ".join(filas) + "\n      </table>")


def resumen_parrafo(texto):
    """Formato anterior (un solo párrafo), para ediciones sin resumen_paises."""
    return ('      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#EEF5FB; '
            'border-left:4px solid #009EDB; border-radius:4px;"><tr><td style="padding:16px 20px;">'
            f'<p style="margin:0; font-size:15px; line-height:23px; color:#1F2D3A;">{texto}</p></td></tr></table>')


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
    if n.get("en_seguimiento"):
        t.append(Ss if small else S)
    return t


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    carpeta = Path(sys.argv[1])
    final = "--final" in sys.argv
    datos = json.loads((carpeta / "datos.json").read_text(encoding="utf-8"))
    ed = datos["edicion"]
    if ed.get("resumen_paises") and not ed.get("resumen"):
        ed["resumen"] = " ".join(f'{r["pais"]}: {r["texto"].strip()}' for r in ed["resumen_paises"] if r.get("texto"))
        (carpeta / "datos.json").write_text(json.dumps(datos, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
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
        b = marca_noticia(b, n, i)
        for k, v in {"{{N}}": str(i), "{{URL DEL ARTÍCULO ORIGINAL}}": n["url"], "{{TITULAR EN ESPAÑOL}}": n["titular"],
                     "{{UNA FRASE sobre qué pasó, con palabras propias}}": n.get("resumen") or "",
                     "{{FUENTE}}": n["fuente"], "{{PAÍS}}": n["pais"], "{{CATEGORÍA}}": n["categoria"]}.items():
            b = b.replace(k, v)
        html_cards.append(b)

    html_list = []
    for i, n in enumerate(resto, len(destacadas) + 1):
        tg = etiquetas(n, small=True)
        # reemplazar las etiquetas antes de limpiar comentarios: el bloque de ejemplo empieza con uno
        b = item.replace(tag_list, ('\n            <div style="font-size:10px; line-height:15px; padding-bottom:3px;">\n              ' + "\n              ".join(tg) + '\n            </div>') if tg else "")
        b = limpiar_comentarios(b)
        b = marca_noticia(b, n, i)
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
    if not html_list:  # días con 5 noticias o menos: sin sección «Más titulares»
        out = re.sub(r"  <!-- MÁS TITULARES.*?  </tr>\n\n", "", out, flags=re.S)
    if not html_pubs:
        out = re.sub(r"  <!-- INVESTIGACIÓN DESTACADA.*?  </tr>\n\n", "", out, flags=re.S)
    out = re.sub(r"<!--\n  PLANTILLA.*?-->\n", "", out, flags=re.S)
    reemplazos = {
        "{{DÍA DD MES AÑO}}": ed["fecha_larga"],
        "{{PREHEADER: los 2–3 titulares principales del día en una frase}}": ed["preheader"],
        "{{NÚMERO}}": str(ed["numero"]),
        "{{Día DD de mes de AAAA}} · {{N}} noticias · {{N}} investigaciones":
            f'{ed["fecha_larga"]} · {len(datos["noticias"])} noticias · {len(datos["investigaciones"])} investigaciones',
        "{{RESUMEN_PAISES}}": (resumen_paises(ed, ed.get("url_web") or f'{CONF_URL}archivo/{ed["fecha"]}.html')
                               if ed.get("resumen_paises") else resumen_parrafo(ed["resumen"])),
        "{{día DD de mes, 07:01}}": ed["ventana_texto_inicio"],
        "{{día DD de mes, 07:00}}": ed["ventana_texto_fin"],
        "{{URL_SITIO}}": CONF_URL,
    }
    for k, v in reemplazos.items():
        out = out.replace(k, v)
    if any(n.get("en_seguimiento") for n in datos["noticias"]):
        out = out.replace("mayor interés para la oficina\n", "mayor interés para la oficina" + LEYENDA_SEG + "\n", 1)
    out = out.replace("<title>", f'<meta name="rr-edicion" content="{ed["numero"]}|{ed["fecha"]}">\n<title>', 1)
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
