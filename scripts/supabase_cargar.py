#!/usr/bin/env python3
"""Carga una o más ediciones del Radar Regional en Supabase.

Uso:
    python3 scripts/supabase_cargar.py output/radar/2026-10-23-diario [otra carpeta ...]

Cada carpeta debe tener `datos.json` (estructura de la edición) y el HTML indicado en
`html_archivo`. Requiere un archivo `.env` en la raíz del proyecto con:

    SUPABASE_URL=https://<proyecto>.supabase.co
    SUPABASE_SERVICE_ROLE_KEY=<clave secreta service_role>

La clave service_role es secreta: nunca se publica ni se sube a GitHub (`.env` está en .gitignore).
Volver a cargar una edición la reemplaza (mismo `slug`), sin duplicar filas.
"""
import json
import os
import sys
import urllib.error
import urllib.request
from pathlib import Path

RAIZ = Path(__file__).resolve().parent.parent


def leer_env():
    env = {}
    ruta = RAIZ / ".env"
    if not ruta.exists():
        sys.exit("Falta el archivo .env en la raíz del proyecto (ver docstring).")
    for linea in ruta.read_text(encoding="utf-8").splitlines():
        linea = linea.strip()
        if linea and not linea.startswith("#") and "=" in linea:
            k, v = linea.split("=", 1)
            env[k.strip()] = v.strip().strip('"').strip("'")
    for clave in ("SUPABASE_URL", "SUPABASE_SERVICE_ROLE_KEY"):
        if not env.get(clave):
            sys.exit(f"Falta {clave} en .env")
    return env["SUPABASE_URL"].rstrip("/"), env["SUPABASE_SERVICE_ROLE_KEY"]


def pedir(metodo, url, clave, cuerpo=None, prefer=None):
    datos = json.dumps(cuerpo, ensure_ascii=False).encode("utf-8") if cuerpo is not None else None
    req = urllib.request.Request(url, data=datos, method=metodo)
    req.add_header("apikey", clave)
    req.add_header("Authorization", f"Bearer {clave}")
    req.add_header("Content-Type", "application/json")
    if prefer:
        req.add_header("Prefer", prefer)
    try:
        with urllib.request.urlopen(req, timeout=60) as r:
            texto = r.read().decode("utf-8")
            return json.loads(texto) if texto else None
    except urllib.error.HTTPError as e:
        sys.exit(f"Error {e.code} en {metodo} {url}: {e.read().decode('utf-8')}")


def cargar(carpeta, base, clave):
    carpeta = Path(carpeta)
    datos = json.loads((carpeta / "datos.json").read_text(encoding="utf-8"))
    columnas = {"slug", "tipo", "numero", "fecha", "ventana_inicio", "ventana_fin", "titulo", "resumen", "url_web"}
    ed = {k: v for k, v in datos["edicion"].items() if k in columnas}  # ignora campos solo de presentación
    ed["html"] = (carpeta / datos["html_archivo"]).read_text(encoding="utf-8")
    ed["n_noticias"] = len(datos["noticias"])
    ed["n_investigaciones"] = len(datos["investigaciones"])

    fila = pedir("POST", f"{base}/rest/v1/ediciones?on_conflict=slug", clave, [ed],
                 prefer="resolution=merge-duplicates,return=representation")[0]
    eid = fila["id"]

    # Reemplazar noticias e investigaciones de esa edición
    pedir("DELETE", f"{base}/rest/v1/noticias?edicion_id=eq.{eid}", clave)
    pedir("DELETE", f"{base}/rest/v1/investigaciones?edicion_id=eq.{eid}", clave)
    if datos["noticias"]:
        pedir("POST", f"{base}/rest/v1/noticias", clave,
              [dict(n, edicion_id=eid) for n in datos["noticias"]], prefer="return=minimal")
    if datos["investigaciones"]:
        pedir("POST", f"{base}/rest/v1/investigaciones", clave,
              [dict(i, edicion_id=eid) for i in datos["investigaciones"]], prefer="return=minimal")
    print(f"✓ {ed['slug']}: {ed['n_noticias']} noticias, {ed['n_investigaciones']} investigaciones (id {eid})")


def main():
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    base, clave = leer_env()
    for carpeta in sys.argv[1:]:
        cargar(carpeta, base, clave)


if __name__ == "__main__":
    main()
