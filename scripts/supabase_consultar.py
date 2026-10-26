#!/usr/bin/env python3
"""Consulta el archivo del Radar Regional en Supabase (solo lectura, clave pública).

Uso:
    python3 scripts/supabase_consultar.py "litio" [--pais Bolivia] [--categoria Energía]
        [--desde 2026-10-01] [--hasta 2026-10-31] [--tipo noticias|investigaciones|ambos] [--limite 50]

Sin texto de búsqueda, lista lo más reciente que cumpla los filtros.
Usa SUPABASE_URL y SUPABASE_ANON_KEY de config/supabase.json (claves públicas de lectura).
"""
import argparse
import json
import sys
import urllib.parse
import urllib.request
from pathlib import Path

RAIZ = Path(__file__).resolve().parent.parent


def conf():
    c = json.loads((RAIZ / "config" / "supabase.json").read_text(encoding="utf-8"))
    if not c.get("anon_key") or c["anon_key"].startswith("PENDIENTE"):
        sys.exit("Falta la clave pública (anon key) en config/supabase.json")
    return c["url"].rstrip("/"), c["anon_key"]


def get(base, clave, ruta, params):
    url = f"{base}/rest/v1/{ruta}?" + urllib.parse.urlencode(params, safe="(),.:*")
    req = urllib.request.Request(url)
    req.add_header("apikey", clave)
    req.add_header("Authorization", f"Bearer {clave}")
    with urllib.request.urlopen(req, timeout=60) as r:
        return json.loads(r.read().decode("utf-8"))


def filtros(a, campo_texto="busqueda"):
    p = []
    if a.texto:
        p.append((campo_texto, f"wfts(spanish).{a.texto}"))
    if a.desde:
        p.append(("edicion_fecha", f"gte.{a.desde}"))
    if a.hasta:
        p.append(("edicion_fecha", f"lte.{a.hasta}"))
    return p


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("texto", nargs="?", default="")
    ap.add_argument("--pais")
    ap.add_argument("--categoria")
    ap.add_argument("--desde")
    ap.add_argument("--hasta")
    ap.add_argument("--tipo", default="ambos", choices=["noticias", "investigaciones", "ambos"])
    ap.add_argument("--limite", type=int, default=50)
    a = ap.parse_args()
    base, clave = conf()

    if a.tipo in ("noticias", "ambos"):
        p = filtros(a)
        if a.pais:
            p.append(("pais", f"ilike.*{a.pais}*"))
        if a.categoria:
            p.append(("categoria", f"ilike.*{a.categoria}*"))
        p += [("select", "edicion_fecha,edicion_slug,posicion,titular,fuente,pais,categoria,mas_difundida,mas_relevante,url"),
              ("order", "edicion_fecha.desc,posicion.asc"), ("limit", str(a.limite))]
        filas = get(base, clave, "noticias_con_edicion", p)
        print(f"\n## Noticias ({len(filas)})")
        for f in filas:
            tags = ("🔥" if f["mas_difundida"] else "") + ("⭐" if f["mas_relevante"] else "")
            print(f"- {f['edicion_fecha']} #{f['posicion']} {tags} {f['titular']} — {f['fuente']} · {f['pais']} · {f['categoria']}\n  {f['url']}")

    if a.tipo in ("investigaciones", "ambos"):
        p = filtros(a)
        p += [("select", "edicion_fecha,posicion,titulo_es,autores,revista,ambito,tipo,url"),
              ("order", "edicion_fecha.desc,posicion.asc"), ("limit", str(a.limite))]
        filas = get(base, clave, "investigaciones_con_edicion", p)
        print(f"\n## Investigaciones ({len(filas)})")
        for f in filas:
            print(f"- {f['edicion_fecha']} #{f['posicion']} {f['titulo_es']} — {f['autores']} · {f['revista']} · {f['ambito']}\n  {f['url']}")


if __name__ == "__main__":
    main()
