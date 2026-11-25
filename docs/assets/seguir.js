/* Botón «☆ Seguir» bajo cada titular de la copia web del boletín (Inicio y Archivo).
   Al pulsarlo aparece una caja para escribir cuántas semanas (1–52) seguir la noticia; se guarda en Supabase
   y la noticia aparece en la pestaña Seguimiento. El correo no lleva este botón. */
(function () {
  var R = window.RR;
  if (!R) return;
  var enlaces = document.querySelectorAll("a.rr-noticia");
  if (!enlaces.length) return;
  var meta = (document.querySelector('meta[name="rr-edicion"]') || {}).content || "";
  var numero = parseInt(meta.split("|")[0], 10) || null, fecha = meta.split("|")[1] || null;
  var base = (document.querySelector('link[rel="rr-base"]') || {}).href || "https://isacoli.github.io/radar-regional/";

  var css = document.createElement("style");
  css.textContent =
    ".rr-seguir{margin-top:8px;font-family:Arial,Helvetica,sans-serif}" +
    ".rr-btn{background:#fff;border:1px solid #0067B1;color:#0067B1;border-radius:999px;padding:4px 12px;font-size:12px;font-weight:bold;cursor:pointer}" +
    ".rr-btn.on{background:#E7F5EA;border-color:#2E7D3E;color:#2E7D3E}" +
    ".rr-panel{margin-top:8px;background:#EEF5FB;border-radius:8px;padding:10px 12px;display:inline-block}" +
    ".rr-panel label{font-size:13px;font-weight:bold;color:#003A70}" +
    ".rr-panel input{width:62px;margin:0 6px;padding:5px 7px;border:1px solid #DCE6EF;border-radius:6px;font-size:14px;font-weight:bold;color:#003A70;text-align:center;background:#fff}" +
    ".rr-ok{margin-left:8px;background:#003A70;color:#fff;border:0;border-radius:6px;padding:6px 12px;font-size:12px;font-weight:bold;cursor:pointer}" +
    ".rr-msg{font-size:12px;color:#6B7B8B;margin-top:6px}.rr-msg a{color:#0067B1}.rr-err{color:#C0392B}";
  document.head.appendChild(css);

  function hasta(w, inicio) { return R.fm(R.fin({ inicio: inicio || R.hoy().toISOString().slice(0, 10), semanas: w })); }

  R.get("seguimientos?select=id,noticia_url,semanas,inicio").then(function (filas) {
    var porUrl = {};
    (filas || []).forEach(function (s) { porUrl[s.noticia_url] = s; });
    enlaces.forEach(function (a) { montar(a, porUrl[a.href] || porUrl[a.getAttribute("href")]); });
  }).catch(function () {
    enlaces.forEach(function (a) { montar(a, null); });
  });

  function montar(a, existente) {
    var caja = document.createElement("div");
    caja.className = "rr-seguir";
    a.parentNode.appendChild(caja);
    var s = existente;
    function boton() {
      var activo = s && R.estado(s) !== "Terminado";
      return '<button type="button" class="rr-btn' + (activo ? " on" : "") + '">' +
        (activo ? "★ En seguimiento · hasta el " + R.fm(R.fin(s)) : (s ? "☆ Seguir de nuevo" : "☆ Seguir")) + "</button>";
    }
    function pintar(abierto, msg) {
      var w = s ? s.semanas : 4;
      caja.innerHTML = boton() + (abierto
        ? '<div class="rr-panel"><label>Seguir durante<input type="number" min="1" max="52" value="' + w + '">semanas</label>' +
          '<button type="button" class="rr-ok">Seguir</button><div class="rr-msg">' + (msg || ("Hasta el " + hasta(w, s && s.inicio) + ".")) + "</div></div>"
        : (msg ? '<div class="rr-msg">' + msg + "</div>" : ""));
      caja.querySelector(".rr-btn").onclick = function () { pintar(!abierto); };
      if (!abierto) return;
      var inp = caja.querySelector("input"), info = caja.querySelector(".rr-msg");
      inp.focus();
      inp.oninput = function () {
        var n = R.semanas(inp.value);
        info.innerHTML = n ? "Hasta el " + hasta(n, s && s.inicio) + "." : '<span class="rr-err">Escriba un número de 1 a 52.</span>';
      };
      inp.onkeydown = function (e) { if (e.key === "Enter") caja.querySelector(".rr-ok").click(); };
      caja.querySelector(".rr-ok").onclick = function () {
        var n = R.semanas(inp.value);
        if (!n) return;
        info.textContent = "Guardando…";
        var p = s
          ? R.patch("seguimientos?id=eq." + s.id, { semanas: n })
          : R.post("seguimientos", {
              noticia_url: a.href, titular: a.textContent.trim(), pais: a.dataset.pais || null,
              fuente: a.dataset.fuente || null, categoria: a.dataset.categoria || null,
              edicion_numero: numero, edicion_fecha: fecha, semanas: n
            });
        p.then(function (r) {
          s = (r && r[0]) || s;
          pintar(false, "✓ En seguimiento hasta el " + R.fm(R.fin(s)) + '. <a href="' + base + 'seguimiento/">Ver en Seguimiento</a>');
        }).catch(function () {
          info.innerHTML = '<span class="rr-err">No se pudo guardar. Inténtelo de nuevo.</span>';
        });
      };
    }
    pintar(false);
  }
})();
