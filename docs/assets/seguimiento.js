/* Pestaña Seguimiento: cronograma de las noticias seguidas + ficha desplegable de cada una.
   Datos: Supabase (tablas seguimientos y seguimiento_avances, ver supabase/seguimiento.sql). */
(function () {
  var R = window.RR, esc = R.esc;
  var BANDERA = { "Perú": "pe", "Colombia": "co", "Ecuador": "ec", "Bolivia": "bo", "Venezuela": "ve" };
  var COLOR = { "Activo": ["#E7F5EA", "#2E7D3E"], "Termina pronto": ["#FFF5D6", "#8A6500"], "Terminado": ["#EEF1F4", "#4A5A6A"] };
  var lista = document.getElementById("lista"), filtroActual = "todos", datos = [], A0, SPAN;

  function bandera(pais) {
    return '<img class="flag" src="../assets/banderas/' + (BANDERA[pais] || "regional") + '.png" width="22" height="22" alt="">';
  }
  function chip(e) { return '<span class="chip" style="background:' + COLOR[e][0] + ";color:" + COLOR[e][1] + '">' + e + "</span>"; }
  function x(d) { return Math.max(0, Math.min(100, 100 * ((d - A0) / 864e5) / SPAN)); }
  function plural(n, a, b) { return n + " " + (n === 1 ? a : b); }
  function medio(s, a) { return a.fuente && s.fuente && a.fuente === s.fuente ? "mismo medio" : "otro medio"; }
  function plazoTxt(s) {
    var e = R.estado(s), d = (R.hoy() - R.dia(s.inicio)) / 864e5;
    return e === "Terminado" ? "Terminó el " + R.fm(R.fin(s)) : "Sem. " + Math.min(s.semanas, Math.floor(d / 7) + 1) + " de " + s.semanas;
  }
  function pct(s) { return Math.min(100, Math.max(0, Math.round(100 * ((R.hoy() - R.dia(s.inicio)) / 864e5) / (7 * s.semanas)))); }

  /* Escala del cronograma: desde la fecha más antigua (origen o avance) hasta el fin más lejano */
  function escala() {
    var min = R.hoy(), max = R.mas(R.hoy(), 14);
    datos.forEach(function (s) {
      [s.edicion_fecha, s.inicio].concat(s.avances.map(function (a) { return a.fecha; })).forEach(function (f) {
        if (f && R.dia(f) < min) min = R.dia(f);
      });
      if (R.fin(s) > max) max = R.fin(s);
    });
    min = R.mas(min, -((min.getDay() + 6) % 7) - 3);  // lunes anterior, con margen
    max = R.mas(max, 4);
    A0 = min; SPAN = Math.max(28, (max - min) / 864e5);
  }
  function ejes() {
    var semanas = Math.ceil(SPAN / 7), paso = semanas > 16 ? 4 : semanas > 8 ? 2 : 1, et = "", gl = "";
    for (var i = 0; i <= semanas; i++) {
      var d = R.mas(A0, 7 * i);
      if (x(d) >= 100) break;
      gl += '<span class="gl" style="left:' + x(d) + '%"></span>';
      if (i % paso === 0) et += '<span class="wk" style="left:' + x(d) + '%">' + R.fm(d) + "</span>";
    }
    return { et: et, gl: gl };
  }

  function fila(s, gl) {
    var e = R.estado(s), c = COLOR[e], ini = R.dia(s.inicio), fin = R.fin(s);
    var av = s.avances.slice().sort(function (a, b) { return a.fecha < b.fecha ? -1 : 1; });
    var origenF = R.dia(s.edicion_fecha || s.inicio);
    var dots = av.map(function (a) {
      return '<a class="dot" href="' + esc(a.url) + '" target="_blank" rel="noopener" style="left:' + x(R.dia(a.fecha)) + '%" onclick="event.stopPropagation()">' +
        '<span class="tip">' + R.fm(R.dia(a.fecha)) + " · " + esc(a.fuente) + "<br>" + esc(a.titular) + "</span></a>";
    }).join("");
    var rec = av.slice().reverse(), item = function (a) {
      return '<li class="tl"><span class="fecha">' + R.fm(R.dia(a.fecha)) + '</span><a href="' + esc(a.url) + '" target="_blank" rel="noopener">' + esc(a.titular) +
        '</a><div class="nota">' + esc(a.fuente) + " · " + medio(s, a) + (a.edicion_numero ? " · Radar N.º " + a.edicion_numero : " · fuera del boletín") + "</div></li>";
    };
    var tl = rec.slice(0, 5).map(item).join("");
    if (rec.length > 5) tl += '<li class="mas-ant"><details><summary>Ver los ' + (rec.length - 5) + ' avances anteriores</summary><ul class="tlist" style="border:0;padding:0;margin-left:-14px">' + rec.slice(5).map(item).join("") + "</ul></details></li>";
    tl += '<li class="tl origen"><span class="fecha">' + R.fm(origenF) + '</span><a href="' + esc(s.noticia_url) + '" target="_blank" rel="noopener">' + esc(s.titular) +
      '</a><div class="nota">Noticia de origen · ' + esc(s.fuente) + (s.edicion_numero ? " · Radar N.º " + s.edicion_numero : "") + "</div></li>";
    var ult = rec[0];
    return '<div class="fila" data-id="' + s.id + '" data-estado="' + e + '">' +
      '<div class="cab" role="button" tabindex="0" aria-expanded="false">' +
      '<span class="lab">' + bandera(s.pais) + "<span><b>" + esc(s.titular) + '</b><span class="sub">' + plural(s.semanas, "semana", "semanas") + " · " + plural(av.length, "avance", "avances") + "</span></span></span>" +
      '<span class="track">' + gl + '<span class="hoy" style="left:' + x(R.hoy()) + '%"></span>' +
      '<span class="gbar" style="left:' + x(ini) + "%;width:" + (x(fin) - x(ini)) + "%;background:" + c[0] + ";border-color:" + c[1] + '"><span class="pct" style="width:' + pct(s) + "%;background:" + c[1] + '"></span></span>' +
      '<span class="dot origen" style="left:' + x(origenF) + '%"></span>' + dots + "</span>" +
      '<span class="est">' + chip(e) + '<span class="sub">' + plazoTxt(s) + "</span></span>" +
      '<span class="flecha">▾</span></div>' +
      '<div class="det">' +
      '<div class="meta">Desde el ' + R.fm(ini) + " hasta el <b>" + R.fm(fin) + "</b> · " + esc(s.pais || "") + " · " + esc(s.categoria || "") + "</div>" +
      (s.balance ? '<div class="balance"><b>Balance del seguimiento:</b> ' + esc(s.balance) + "</div>" : "") +
      '<div class="plazo-box"><label class="caja">Seguir durante <input type="number" min="1" max="52" value="' + s.semanas + '"> semanas</label>' +
      '<span class="nota">' + (e === "Terminado" ? "Escriba más semanas para reactivarlo." : "Cuenta desde el " + R.fm(ini) + ". Cambie el número para alargarlo o acortarlo.") + "</span></div>" +
      '<div class="ult"><span class="lbl">Último avance</span> ' + (ult ? '<a href="' + esc(ult.url) + '" target="_blank" rel="noopener">' + esc(ult.titular) + '</a> <span class="nota">(' + R.fm(R.dia(ult.fecha)) + ", " + esc(ult.fuente) + ")</span>" : '<span class="nota">Todavía sin avances: el Radar los busca cada mañana.</span>') + "</div>" +
      '<div class="lbl" style="margin-top:14px">Línea de tiempo</div><ul class="tlist">' + tl + "</ul></div></div>";
  }

  function pintar() {
    var cont = { "Activo": 0, "Termina pronto": 0, "Terminado": 0 }, nav = 0;
    datos.forEach(function (s) { cont[R.estado(s)]++; if (R.estado(s) !== "Terminado") nav += s.avances.length; });
    document.getElementById("kpis").innerHTML =
      "<div><b>" + (cont.Activo + cont["Termina pronto"]) + "</b><span>seguimientos activos</span></div>" +
      "<div><b>" + cont["Termina pronto"] + "</b><span>terminan esta semana</span></div>" +
      "<div><b>" + nav + "</b><span>avances registrados</span></div>" +
      "<div><b>" + cont.Terminado + "</b><span>terminados</span></div>";
    var f = '<span class="lbl">Ver</span><button class="fb" data-f="todos">Todos <i>' + datos.length + "</i></button>";
    Object.keys(cont).forEach(function (k) { f += '<button class="fb" data-f="' + k + '">' + k + " <i>" + cont[k] + "</i></button>"; });
    document.getElementById("filtros").innerHTML = f;
    if (!datos.length) {
      lista.innerHTML = '<div class="cron"><div class="vacio">Todavía no hay noticias en seguimiento.<br>Márquelas con «☆ Seguir» bajo cualquier titular en <a href="../">Inicio</a>.</div></div>';
      document.getElementById("leyenda").hidden = true;
      return conectar();
    }
    escala();
    var e = ejes();
    var orden = { "Termina pronto": 0, "Activo": 1, "Terminado": 2 };
    var filas = datos.slice().sort(function (a, b) { return orden[R.estado(a)] - orden[R.estado(b)] || (R.fin(a) - R.fin(b)); });
    lista.innerHTML = '<div class="cron"><div class="ejes"><span></span><span class="track">' + e.et +
      '<span class="hoy" style="left:' + x(R.hoy()) + '%"><em>hoy</em></span></span><span></span><span></span></div>' +
      filas.map(function (s) { return fila(s, e.gl); }).join("") + "</div>";
    document.getElementById("leyenda").hidden = false;
    conectar();
  }

  function conectar() {
    document.querySelectorAll(".fb").forEach(function (b) {
      b.classList.toggle("on", b.dataset.f === filtroActual);
      b.onclick = function () { filtroActual = b.dataset.f; aplicarFiltro(); conectar(); };
    });
    aplicarFiltro();
    document.querySelectorAll(".fila").forEach(function (f) {
      var cab = f.querySelector(".cab");
      cab.onclick = function () { f.classList.toggle("abierta"); cab.setAttribute("aria-expanded", f.classList.contains("abierta")); };
      cab.onkeydown = function (ev) { if (ev.key === "Enter" || ev.key === " ") { ev.preventDefault(); cab.onclick(); } };
      var inp = f.querySelector(".plazo-box input"), nota = f.querySelector(".plazo-box .nota"), t;
      inp.oninput = function () {
        clearTimeout(t);
        var w = R.semanas(inp.value);
        if (!w) { nota.innerHTML = '<span class="error">Escriba un número de 1 a 52.</span>'; return; }
        t = setTimeout(function () { guardar(f.dataset.id, w, nota); }, 700);
      };
    });
  }
  function aplicarFiltro() {
    document.querySelectorAll(".fila").forEach(function (f) { f.hidden = !(filtroActual === "todos" || f.dataset.estado === filtroActual); });
  }
  function guardar(id, w, nota) {
    nota.textContent = "Guardando…";
    R.patch("seguimientos?id=eq." + id, { semanas: w }).then(function (r) {
      var s = datos.filter(function (d) { return String(d.id) === String(id); })[0];
      s.semanas = r && r[0] ? r[0].semanas : w;
      var abierta = id;
      pintar();
      var f = document.querySelector('.fila[data-id="' + abierta + '"]');
      if (f) { f.classList.add("abierta"); f.querySelector(".plazo-box .nota").innerHTML = '<span class="guardado">✓ Guardado: ' + w + (w === 1 ? " semana" : " semanas") + ", hasta el " + R.fm(R.fin(s)) + ".</span>"; }
    }).catch(function () { nota.innerHTML = '<span class="error">No se pudo guardar. Inténtelo de nuevo.</span>'; });
  }

  R.get("seguimientos?select=*,avances:seguimiento_avances(fecha,titular,url,fuente,edicion_numero)&order=inicio.desc")
    .then(function (r) { datos = r || []; pintar(); })
    .catch(function () {
      lista.innerHTML = '<div class="cron"><div class="vacio">No se pudieron cargar los seguimientos en este momento. Vuelva a intentarlo más tarde.</div></div>';
    });
})();
