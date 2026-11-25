#!/usr/bin/env python3
"""Seguimientos del Radar Regional (pestaña «Seguimiento» del sitio; tablas en supabase/seguimiento.sql).

Las personas marcan noticias desde la web («☆ Seguir» + número de semanas). Cada mañana el Radar:
  1. lista los seguimientos activos y los terminados sin balance;
  2. busca novedades del mismo tema dentro de la ventana del día (mismo medio u otros de confianza)
     y registra cada una como avance;
  3. al terminar el plazo, escribe un balance breve.

Uso:
    python3 scripts/seguimiento.py listar
    python3 scripts/seguimiento.py avance ID --fecha AAAA-MM-DD --titular "..." --url https://... --fuente "..." [--edicion N]
    python3 scripts/seguimiento.py balance ID "Texto del balance (2–3 frases, en español)"

Requiere `.env` con SUPABASE_URL y SUPABASE_SERVICE_ROLE_KEY (igual que supabase_cargar.py).
"""
import argparse
import datetime as dt
import json
import sys
import urllib.parse
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from supabase_cargar import leer_env, pedir  # noqa: E402


def hoy_bogota():
    return (dt.datetime.now(dt.timezone.utc) - dt.timedelta(hours=5)).date()


def listar(base, clave):
    filas = pedir("GET", f"{base}/rest/v1/seguimientos?select=*,avances:seguimiento_avances(fecha,url,titular,fuente)&order=inicio", clave) or []
    hoy = hoy_bogota()
    activos, por_cerrar = [], []
    for s in filas:
        fin = dt.date.fromisoformat(s["inicio"]) + dt.timedelta(weeks=s["semanas"])
        s["fin"] = fin.isoformat()
        if hoy < fin:
            activos.append(s)
        elif not s.get("balance"):
            por_cerrar.append(s)
    print(f"Hoy (Bogotá): {hoy} · {len(activos)} activos · {len(por_cerrar)} terminados sin balance\n")
    for titulo, grupo in (("ACTIVOS — buscar novedades del tema en la ventana del día", activos),
                          ("TERMINADOS SIN BALANCE — escribir el balance", por_cerrar)):
        print(f"== {titulo} ==")
        for s in grupo:
            print(f"[{s['id']}] {s['titular']}")
            print(f"     {s.get('pais') or '—'} · {s.get('fuente') or '—'} · Radar N.º {s.get('edicion_numero') or '—'} · "
                  f"desde {s['inicio']} · {s['semanas']} sem. · hasta {s['fin']}")
            print(f"     origen: {s['noticia_url']}")
            for a in sorted(s.get("avances") or [], key=lambda a: a["fecha"]):
                print(f"     avance {a['fecha']}: {a['titular']} ({a.get('fuente') or '—'}) {a['url']}")
        if not grupo:
            print("(ninguno)")
        print()


def avance(base, clave, a):
    fila = {"seguimiento_id": a.id, "fecha": a.fecha, "titular": a.titular, "url": a.url,
            "fuente": a.fuente, "edicion_numero": a.edicion}
    if not a.url.startswith("https://"):
        sys.exit("La URL del avance debe empezar con https://")
    r = pedir("POST", f"{base}/rest/v1/seguimiento_avances?on_conflict=seguimiento_id,url", clave, fila,
              prefer="resolution=ignore-duplicates,return=representation")
    print("✓ avance registrado" if r else "· ya estaba registrado (mismo enlace)")


def balance(base, clave, a):
    r = pedir("PATCH", f"{base}/rest/v1/seguimientos?id=eq.{a.id}", clave, {"balance": a.texto}, prefer="return=representation")
    print("✓ balance guardado" if r else f"No existe el seguimiento {a.id}")


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = p.add_subparsers(dest="accion", required=True)
    sub.add_parser("listar")
    pa = sub.add_parser("avance")
    pa.add_argument("id", type=int)
    pa.add_argument("--fecha", required=True)
    pa.add_argument("--titular", required=True)
    pa.add_argument("--url", required=True)
    pa.add_argument("--fuente", required=True)
    pa.add_argument("--edicion", type=int, default=None, help="N.º del Radar si el avance también salió en el boletín")
    pb = sub.add_parser("balance")
    pb.add_argument("id", type=int)
    pb.add_argument("texto")
    a = p.parse_args()
    dt.date.fromisoformat(a.fecha) if a.accion == "avance" else None
    base, clave = leer_env()
    {"listar": lambda: listar(base, clave), "avance": lambda: avance(base, clave, a),
     "balance": lambda: balance(base, clave, a)}[a.accion]()


if __name__ == "__main__":
    main()
