/* Radar Regional — banner con fotos que se alternan (solo sitio web; el correo usa una foto fija).
   Se aplica al encabezado de las páginas del sitio (.sitio-header) y al banner de las ediciones (td.banner).
   Solo cambia la foto del banner: el resto de la página no se recarga. Fotos y créditos: config/design.md. */
(function () {
  const BASE = new URL("banner/", document.currentScript.src).href;
  const FOTOS = [
    { img: "paranal-armazones-chile.jpg", titulo: "Planta fotovoltaica Paranal-Armazones, Chile (Atacama)", credito: "ESO · CC BY 4.0",
      pagina: "https://commons.wikimedia.org/wiki/File:The_Paranal-Armazones_photovoltaic_plant_(ann22010d).jpg" },
    { img: "jepirachi-colombia.jpg", titulo: "Parque eólico Jepírachi, Colombia (La Guajira)", credito: "Taggen · CC BY-SA 4.0",
      pagina: "https://commons.wikimedia.org/wiki/File:Jepirrachi.jpg" },
    { img: "marangani-peru.jpg", titulo: "Fábrica textil de Marangani, Perú (Cusco)", credito: "Uriel Caballero Quispitupa · CC BY-SA 4.0",
      pagina: "https://commons.wikimedia.org/wiki/File:Fabrica_de_textiles_marangani_9.jpg" },
    { img: "hortolandia-brasil.jpg", titulo: "Planta de reciclaje de Hortolândia, Brasil (São Paulo)", credito: "Ana Perugini · CC BY 2.0",
      pagina: "https://commons.wikimedia.org/wiki/File:Usina_de_reciclagem_em_Hortol%C3%A2ndia_SP.jpg" }
  ];
  const INTERVALO = 7000;  // ms entre fotos

  const header = document.querySelector(".sitio-header, td.banner");
  if (!header) return;

  const css = document.createElement("style");
  css.textContent = `
    .sitio-header, td.banner { position:relative; overflow:hidden; }
    .sitio-header { min-height:170px; }
    .sitio-header > *:not(.carrusel), td.banner > *:not(.carrusel) { position:relative; z-index:2; }
    .carrusel { position:absolute; inset:0; z-index:0; overflow:hidden; }
    .carrusel .foto { position:absolute; inset:0; background-size:cover; background-position:center; opacity:0; transition:opacity 1.6s ease; transform:scale(1.02); }
    .carrusel .foto.activa { opacity:1; animation:carrusel-acercar 9s ease-out forwards; }
    @keyframes carrusel-acercar { from { transform:scale(1.02); } to { transform:scale(1.10); } }
    .carrusel::after { content:""; position:absolute; inset:0; z-index:1;
      background:linear-gradient(90deg, #003A70 0%, rgba(0,58,112,.92) 38%, rgba(0,58,112,.45) 70%, rgba(0,58,112,.15) 100%); }
    .carrusel-pie { position:absolute !important; right:18px; bottom:12px; display:flex; flex-direction:column; align-items:flex-end; gap:6px; }
    .carrusel-puntos { display:flex; gap:6px; }
    .carrusel-puntos button { width:8px; height:8px; padding:0; border-radius:50%; border:1px solid rgba(255,255,255,.8); background:transparent; cursor:pointer; transition:all .3s; }
    .carrusel-puntos button.activo { background:#fff; width:22px; border-radius:4px; }
    .carrusel-credito { font:10px/14px Arial, Helvetica, sans-serif; color:rgba(255,255,255,.85); text-shadow:0 1px 2px rgba(0,0,0,.6); text-align:right; }
    .carrusel-credito a { color:inherit; }
    @media (max-width:620px) {
      .sitio-header { min-height:190px; padding-bottom:56px !important; }
      td.banner { padding-bottom:64px !important; }
      .carrusel::after { background:linear-gradient(180deg, rgba(0,58,112,.95) 0%, rgba(0,58,112,.80) 55%, rgba(0,58,112,.45) 100%); }
      .carrusel-pie { left:16px; right:16px; align-items:flex-start; }
      .carrusel-credito { text-align:left; }
    }
    @media (prefers-reduced-motion:reduce) { .carrusel .foto { transition:none; } .carrusel .foto.activa { animation:none; } }`;
  document.head.appendChild(css);

  const quieto = matchMedia("(prefers-reduced-motion: reduce)").matches;
  const capa = document.createElement("div"); capa.className = "carrusel"; capa.setAttribute("aria-hidden", "true");
  const pie = document.createElement("div"); pie.className = "carrusel-pie";
  const puntos = document.createElement("div"); puntos.className = "carrusel-puntos";
  const credito = document.createElement("div"); credito.className = "carrusel-credito";
  const capas = FOTOS.map(() => { const d = document.createElement("div"); d.className = "foto"; capa.appendChild(d); return d; });
  FOTOS.forEach((f, i) => {
    const b = document.createElement("button"); b.type = "button"; b.title = f.titulo;
    b.setAttribute("aria-label", "Foto " + (i + 1) + ": " + f.titulo);
    b.addEventListener("click", () => { mostrar(i); reiniciar(); });
    puntos.appendChild(b);
  });
  pie.append(puntos, credito); header.prepend(capa); header.appendChild(pie);

  let actual = -1, timer = null;
  const cargar = i => { const c = capas[i]; if (!c.style.backgroundImage) c.style.backgroundImage = `url("${BASE}${FOTOS[i].img}")`; };
  function mostrar(i) {
    cargar(i); cargar((i + 1) % FOTOS.length);  // precarga la siguiente
    capas.forEach((c, k) => c.classList.toggle("activa", k === i));
    [...puntos.children].forEach((b, k) => b.classList.toggle("activo", k === i));
    const f = FOTOS[i];
    credito.innerHTML = `Foto: ${f.titulo} · <a href="${f.pagina}" target="_blank" rel="noopener">${f.credito}</a>`;
    actual = i;
  }
  const siguiente = () => mostrar((actual + 1) % FOTOS.length);
  function reiniciar() { clearInterval(timer); if (!quieto) timer = setInterval(siguiente, INTERVALO); }
  header.addEventListener("mouseenter", () => clearInterval(timer));
  header.addEventListener("mouseleave", reiniciar);
  document.addEventListener("visibilitychange", () => document.hidden ? clearInterval(timer) : reiniciar());
  mostrar(0); reiniciar();
})();
