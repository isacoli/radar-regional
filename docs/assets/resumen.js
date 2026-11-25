/* Resumen del día por país — solo en la copia web de cada edición.
   En el correo, «más ›» es un enlace a esta página (#resumen-<país>); aquí despliega el resto del texto
   en la misma caja y cambia a «‹ menos». Si se llega con #resumen-<país>, esa caja se abre sola. */
(function () {
  function alternar(a, abrir) {
    var caja = a.parentNode;
    var resto = caja.querySelector(".rp-resto");
    if (!resto) {
      resto = document.createElement("span");
      resto.className = "rp-resto";
      resto.textContent = a.getAttribute("data-resto");
      resto.hidden = true;
      caja.insertBefore(resto, caja.querySelector(".rp-puntos"));
    }
    var mostrar = abrir === undefined ? resto.hidden : abrir;
    resto.hidden = !mostrar;
    caja.querySelector(".rp-puntos").hidden = mostrar;
    a.textContent = mostrar ? "‹ menos" : "más ›";
    a.setAttribute("aria-expanded", mostrar ? "true" : "false");
  }
  var enlaces = document.querySelectorAll("a.rp-mas[data-resto]");
  for (var i = 0; i < enlaces.length; i++) {
    enlaces[i].setAttribute("role", "button");
    enlaces[i].setAttribute("aria-expanded", "false");
    enlaces[i].addEventListener("click", function (e) {
      e.preventDefault();
      alternar(this);
    });
  }
  var ancla = location.hash && document.getElementById(location.hash.slice(1));
  if (ancla && ancla.id.indexOf("resumen-") === 0) {
    var a = ancla.querySelector("a.rp-mas[data-resto]");
    if (a) alternar(a, true);
  }
})();
