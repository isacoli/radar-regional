/* Radar Regional — acceso a Supabase desde el sitio (clave publicable: solo lo que permiten las políticas,
   ver supabase/seguimiento.sql). Lo usan seguir.js (botón «Seguir» en Inicio) y seguimiento.js (pestaña Seguimiento). */
window.RR = (function () {
  var URL = "https://mibponspfvjtkvsrmzag.supabase.co/rest/v1/";
  var KEY = "sb_publishable_OoPaREAwp9P1KHV3vy7o_A_v1KJmmSS";
  var MES = ["ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic"];
  function pedir(metodo, ruta, cuerpo) {
    var h = { apikey: KEY, Authorization: "Bearer " + KEY };
    if (cuerpo) { h["Content-Type"] = "application/json"; h.Prefer = "return=representation"; }
    return fetch(URL + ruta, { method: metodo, headers: h, body: cuerpo ? JSON.stringify(cuerpo) : undefined })
      .then(function (r) {
        if (!r.ok) return r.text().then(function (t) { throw new Error(r.status + " " + t); });
        return r.status === 204 ? null : r.json();
      });
  }
  /* Fechas en hora de Bogotá, como días (sin horas) */
  function hoy() {
    var s = new Date().toLocaleDateString("en-CA", { timeZone: "America/Bogota" });
    return new Date(s + "T12:00:00");
  }
  function dia(iso) { return new Date(String(iso).slice(0, 10) + "T12:00:00"); }
  function mas(d, dias) { return new Date(d.getTime() + dias * 864e5); }
  function fm(d) { return d.getDate() + " " + MES[d.getMonth()]; }
  function fin(s) { return mas(dia(s.inicio), 7 * s.semanas); }
  function estado(s) {
    var f = fin(s), h = hoy();
    if (h >= f) return "Terminado";
    return (f - h) / 864e5 <= 7 ? "Termina pronto" : "Activo";
  }
  function semanas(v) {
    var n = parseInt(v, 10);
    return n >= 1 && n <= 52 ? n : null;
  }
  return {
    get: function (ruta) { return pedir("GET", ruta); },
    post: function (ruta, c) { return pedir("POST", ruta, c); },
    patch: function (ruta, c) { return pedir("PATCH", ruta, c); },
    hoy: hoy, dia: dia, mas: mas, fm: fm, fin: fin, estado: estado, semanas: semanas,
    esc: function (t) { return String(t == null ? "" : t).replace(/[&<>"]/g, function (c) { return { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]; }); }
  };
})();
