-- Carga del historial (generado desde datos.json). Idempotente por slug.
begin;
delete from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.ediciones (slug,tipo,numero,fecha,ventana_inicio,ventana_fin,titulo,resumen,url_web,html,n_noticias,n_investigaciones) values ($q$diario-2026-10-23$q$,$q$diario$q$,1,$q$2026-10-23$q$,$q$2026-10-22T07:01:00-05:00$q$,$q$2026-10-23T07:00:00-05:00$q$,$q$Radar Regional Diario N.º 1 · Viernes 23 de octubre de 2026$q$,$q$La integración andina y la búsqueda de inversión marcan la jornada. Ecuador y Bolivia crearon una Comisión Binacional para impulsar el comercio y las inversiones, y Bolivia aprobó un crédito del BID para modernizar su alumbrado público con tecnología LED. En Perú, la UE y la SNI abrieron un fondo de 550.000 euros para proyectos de industria circular, mientras Promigas advierte que proyectos de gas por US$ 3.936 millones esperan señales regulatorias; El Niño sigue dominando la agenda, con la idea de un nuevo «Reactiva» y la posible suspensión perfecta de labores. En Colombia, el Banco de la República reporta que todas las regiones perdieron dinamismo en el tercer trimestre, el Gobierno negocia retirar el arancel de EE. UU. antes de diciembre y avanza el Plan Nacional de Desarrollo con meta de crecer 6 %. En Ecuador, los autos chinos ya son casi el 57 % de las ventas y la industria local pide incentivos.$q$,$q$https://isacoli.github.io/radar-regional/archivo/2026-10-23.html$q$,$q$<!DOCTYPE html>
<html lang="es" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="x-apple-disable-message-reformatting">
<meta name="color-scheme" content="light">
<meta name="supported-color-schemes" content="light">
<title>Radar Regional Diario · Viernes 23 de octubre de 2026</title>
<style>
  body { margin:0; padding:0; }
  a { color:#0067B1; }
  @media only screen and (max-width:620px) {
    .container { width:100% !important; }
    .px { padding-left:18px !important; padding-right:18px !important; }
    .brand { font-size:30px !important; line-height:34px !important; }
  }
</style>
</head>
<body style="margin:0; padding:0; background-color:#EEF2F6;">

<!-- Preheader: texto de vista previa en la bandeja de entrada (oculto) -->
<div style="display:none; max-height:0; overflow:hidden; mso-hide:all; font-size:1px; line-height:1px; color:#EEF2F6;">
  Comisión binacional Ecuador-Bolivia, fondo europeo para la industria circular en Perú y autos chinos al 57 % en Ecuador.
</div>

<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#EEF2F6;">
<tr><td align="center" style="padding:24px 12px;">

<table role="presentation" class="container" width="600" cellpadding="0" cellspacing="0" border="0" style="width:600px; max-width:600px; background-color:#ffffff; border-radius:8px; overflow:hidden;">


  <!-- BANNER -->
  <tr>
    <td class="px" style="background-color:#003A70; padding:30px 32px 24px 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:11px; line-height:16px; letter-spacing:2px; text-transform:uppercase; color:#A7D8F0;">Oficina Andina de ONUDI · Colombia · Perú · Bolivia · Ecuador</div>
      <div class="brand" style="font-family:Georgia, 'Times New Roman', serif; font-size:36px; line-height:40px; font-weight:bold; color:#ffffff; padding-top:10px;">Radar Regional</div>
      <div style="font-size:14px; line-height:20px; color:#A7D8F0; padding-top:4px;">Boletín diario de desarrollo industrial</div>
      <table role="presentation" cellpadding="0" cellspacing="0" border="0" style="margin-top:16px;">
        <tr>
          <td style="background-color:#0067B1; border-radius:3px; padding:5px 10px; font-size:12px; line-height:16px; font-weight:bold; color:#ffffff; white-space:nowrap;">N.º&nbsp;1</td>
          <td style="padding:5px 0 5px 12px; font-size:13px; line-height:16px; color:#ffffff;">Viernes 23 de octubre de 2026 · 16 noticias · 5 investigaciones</td>
        </tr>
      </table>
      <!-- BOTÓN: siempre apunta a la URL fija del sitio (config/publish.md), que muestra la edición más reciente -->
      <table role="presentation" cellpadding="0" cellspacing="0" border="0" style="margin-top:16px;">
        <tr>
          <td style="background-color:#ffffff; border-radius:4px;">
            <a href="https://isacoli.github.io/radar-regional/" style="display:inline-block; padding:9px 16px; font-family:Arial, Helvetica, sans-serif; font-size:13px; line-height:16px; font-weight:bold; color:#003A70; text-decoration:none;">↻ Ver la edición más reciente</a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <!-- FRANJA DE COLORES -->
  <tr>
    <td style="padding:0; font-size:0; line-height:0;">
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="20%" height="6" style="background-color:#003A70; font-size:0; line-height:0;">&nbsp;</td>
          <td width="20%" height="6" style="background-color:#0067B1; font-size:0; line-height:0;">&nbsp;</td>
          <td width="20%" height="6" style="background-color:#009EDB; font-size:0; line-height:0;">&nbsp;</td>
          <td width="20%" height="6" style="background-color:#5BC2E7; font-size:0; line-height:0;">&nbsp;</td>
          <td width="20%" height="6" style="background-color:#A7D8F0; font-size:0; line-height:0;">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>

  <!-- RESUMEN DEL DÍA -->
  <tr>
    <td class="px" style="padding:26px 32px 4px 32px; font-family:Arial, Helvetica, sans-serif;">
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#EEF5FB; border-left:4px solid #009EDB; border-radius:4px;">
        <tr><td style="padding:16px 20px;">
          <div style="font-size:11px; line-height:16px; font-weight:bold; letter-spacing:1.5px; text-transform:uppercase; color:#003A70;">Resumen del día</div>
          <p style="margin:8px 0 0 0; font-size:15px; line-height:23px; color:#1F2D3A;">La integración andina y la búsqueda de inversión marcan la jornada. Ecuador y Bolivia crearon una Comisión Binacional para impulsar el comercio y las inversiones, y Bolivia aprobó un crédito del BID para modernizar su alumbrado público con tecnología LED. En Perú, la UE y la SNI abrieron un fondo de 550.000 euros para proyectos de industria circular, mientras Promigas advierte que proyectos de gas por US$ 3.936 millones esperan señales regulatorias; El Niño sigue dominando la agenda, con la idea de un nuevo «Reactiva» y la posible suspensión perfecta de labores. En Colombia, el Banco de la República reporta que todas las regiones perdieron dinamismo en el tercer trimestre, el Gobierno negocia retirar el arancel de EE. UU. antes de diciembre y avanza el Plan Nacional de Desarrollo con meta de crecer 6 %. En Ecuador, los autos chinos ya son casi el 57 % de las ventas y la industria local pide incentivos.</p>
        </td></tr>
      </table>
    </td>
  </tr>

  <!-- LEYENDA -->
  <tr>
    <td class="px" style="padding:14px 32px 0 32px; font-family:Arial, Helvetica, sans-serif; font-size:11px; line-height:18px; color:#6B7B8B;">
      <span style="background-color:#FDEBD8; color:#9A4A00; padding:2px 6px; border-radius:3px; font-weight:bold;">🔥 Más difundida</span>&nbsp;cubierta por más fuentes&nbsp;&nbsp;
      <span style="background-color:#E1EEFA; color:#003A70; padding:2px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>&nbsp;mayor interés para la oficina
    </td>
  </tr>

  <!-- LO MÁS DESTACADO: 5 tarjetas -->
  <tr>
    <td class="px" style="padding:22px 32px 4px 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:13px; line-height:18px; font-weight:bold; letter-spacing:1.5px; text-transform:uppercase; color:#003A70; padding-bottom:4px;">Lo más destacado</div>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top:10px; border:1px solid #DCE6EF; border-left:4px solid #0067B1; border-radius:6px;">
        <tr>
          <td width="44" valign="top" style="padding:16px 0 16px 16px; font-family:Georgia, 'Times New Roman', serif; font-size:24px; line-height:28px; font-weight:bold; color:#009EDB;">1</td>
          <td valign="top" style="padding:16px 18px 16px 10px;">
            <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
              <span style="background-color:#FDEBD8; color:#9A4A00; padding:1px 6px; border-radius:3px; font-weight:bold;">🔥 Más difundida</span>
            </div>
            <a href="https://www.opinion.com.bo/pais/senado-aprueba-credito-bid-us-302-millones-modernizar-alumbrado-publico/20261022191207998045.html" style="font-size:17px; line-height:23px; font-weight:bold; color:#003A70; text-decoration:none;">El Senado de Bolivia aprueba un crédito del BID de US$ 30,2 millones para alumbrado público LED</a>
            <div style="font-size:14px; line-height:21px; color:#1F2D3A; padding-top:6px;">El préstamo, a 19,6 años, financiará luminarias LED y sistemas inteligentes de medición en municipios bolivianos; la ley pasa al Ejecutivo para su promulgación.</div>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:6px;">ABI (vía Opinión) · Bolivia · Transición energética</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top:12px; border:1px solid #DCE6EF; border-left:4px solid #0067B1; border-radius:6px;">
        <tr>
          <td width="44" valign="top" style="padding:16px 0 16px 16px; font-family:Georgia, 'Times New Roman', serif; font-size:24px; line-height:28px; font-weight:bold; color:#009EDB;">2</td>
          <td valign="top" style="padding:16px 18px 16px 10px;">
            <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
              <span style="background-color:#E1EEFA; color:#003A70; padding:1px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
            </div>
            <a href="https://sni.org.pe/ue-y-sni-lanzan-nuevo-fondo-de-550-mil-euros-para-impulsar-la-industria-circular-en-ocho-regiones-del-peru/" style="font-size:17px; line-height:23px; font-weight:bold; color:#003A70; text-decoration:none;">La UE y la SNI lanzan un fondo de 550.000 euros para proyectos de industria circular en ocho regiones de Perú</a>
            <div style="font-size:14px; line-height:21px; color:#1F2D3A; padding-top:6px;">La segunda convocatoria cubre hasta el 70 % de 30 proyectos de empresas textiles y de plásticos, y amplía la cobertura de tres a ocho regiones.</div>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:6px;">Sociedad Nacional de Industrias · Perú · Industria verde y economía circular</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top:12px; border:1px solid #DCE6EF; border-left:4px solid #0067B1; border-radius:6px;">
        <tr>
          <td width="44" valign="top" style="padding:16px 0 16px 16px; font-family:Georgia, 'Times New Roman', serif; font-size:24px; line-height:28px; font-weight:bold; color:#009EDB;">3</td>
          <td valign="top" style="padding:16px 18px 16px 10px;">
            <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
              <span style="background-color:#E1EEFA; color:#003A70; padding:1px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
            </div>
            <a href="https://www.eluniverso.com/economia/industrias/acuerdo-bilateral-creacion-comision-binacional-comercio-exterior-exportaciones-bolivia-ecuador-2026-nota/" style="font-size:17px; line-height:23px; font-weight:bold; color:#003A70; text-decoration:none;">Ecuador y Bolivia firman un memorando y crean una Comisión Binacional para impulsar el comercio y las inversiones</a>
            <div style="font-size:14px; line-height:21px; color:#1F2D3A; padding-top:6px;">La comisión identificará oportunidades de intercambio e inversión y organizará misiones empresariales para conectar la oferta exportable con compradores, con foco en pequeños productores.</div>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:6px;">El Universo · Ecuador y Bolivia · Inversión y comercio</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top:12px; border:1px solid #DCE6EF; border-left:4px solid #0067B1; border-radius:6px;">
        <tr>
          <td width="44" valign="top" style="padding:16px 0 16px 16px; font-family:Georgia, 'Times New Roman', serif; font-size:24px; line-height:28px; font-weight:bold; color:#009EDB;">4</td>
          <td valign="top" style="padding:16px 18px 16px 10px;">
            <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
              <span style="background-color:#E1EEFA; color:#003A70; padding:1px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
            </div>
            <a href="https://gestion.pe/economia/proyectos-de-gas-natural-por-us3936-millones-dependen-de-senales-regulatorias-noticia/" style="font-size:17px; line-height:23px; font-weight:bold; color:#003A70; text-decoration:none;">Promigas: la falta de señales regulatorias frena proyectos de gas natural por US$ 3.936 millones en Perú</a>
            <div style="font-size:14px; line-height:21px; color:#1F2D3A; padding-top:6px;">Las nuevas conexiones de gas cayeron de 279.000 en 2024 a 147.000 en 2025; los proyectos pendientes llevarían el servicio a más de 1,5 millones de peruanos.</div>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:6px;">Gestión · Perú · Energía e infraestructura</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="margin-top:12px; border:1px solid #DCE6EF; border-left:4px solid #0067B1; border-radius:6px;">
        <tr>
          <td width="44" valign="top" style="padding:16px 0 16px 16px; font-family:Georgia, 'Times New Roman', serif; font-size:24px; line-height:28px; font-weight:bold; color:#009EDB;">5</td>
          <td valign="top" style="padding:16px 18px 16px 10px;">
            <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
              <span style="background-color:#E1EEFA; color:#003A70; padding:1px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
            </div>
            <a href="https://www.eluniverso.com/economia/industrias/venta-vehiculos-origen-china-568-reporte-aeade-de-enero-a-septiembre-ecuador-2026-nota/" style="font-size:17px; line-height:23px; font-weight:bold; color:#003A70; text-decoration:none;">Los vehículos de origen chino captan casi el 57 % de las ventas en Ecuador; la industria local pide incentivos</a>
            <div style="font-size:14px; line-height:21px; color:#1F2D3A; padding-top:6px;">Las ventas de vehículos nuevos crecieron 40,3 % hasta septiembre; los ensambladores locales, con 11–12 % del mercado, piden menos impuestos para autos con más partes nacionales.</div>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:6px;">El Universo · Ecuador · Inversión y comercio</div>
          </td>
        </tr>
      </table>

    </td>
  </tr>

  <!-- MÁS TITULARES: resto, numeración desde el 6 -->
  <tr>
    <td class="px" style="padding:26px 32px 8px 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:13px; line-height:18px; font-weight:bold; letter-spacing:1.5px; text-transform:uppercase; color:#003A70; border-bottom:2px solid #003A70; padding-bottom:6px;">Más titulares</div>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">6</td>
          <td valign="top" style="padding:11px 0;">
            <div style="font-size:10px; line-height:15px; padding-bottom:3px;">
              <span style="background-color:#E1EEFA; color:#003A70; padding:1px 5px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
            </div>
            <a href="https://www.elespectador.com/economia/macroeconomia/economia-regional-el-consumo-resistio-pero-la-industria-y-la-vivienda-perdieron-fuerza/" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">Banco de la República: la economía de todas las regiones perdió fuerza en el tercer trimestre; la industria, golpeada por el sismo y la baja demanda</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">El Espectador · Colombia · Política industrial y coyuntura</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">7</td>
          <td valign="top" style="padding:11px 0;">
            <a href="https://www.elespectador.com/economia/macroeconomia/estados-unidos-quitara-los-aranceles-a-bienes-colombianos-asi-van-las-negociaciones/" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">Colombia y EE. UU. avanzan hacia un acuerdo para retirar el arancel del 12,5 %; la firma se prevé para diciembre</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">El Espectador · Colombia · Inversión y comercio</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">8</td>
          <td valign="top" style="padding:11px 0;">
            <a href="https://www.elespectador.com/economia/asi-se-esta-construyendo-el-plan-nacional-de-desarrollo-del-gobierno-de-la-espriella/" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">Así se construye el Plan Nacional de Desarrollo 2026-2030: meta de crecer 6 % con más inversión y productividad</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">El Espectador · Colombia · Política industrial</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">9</td>
          <td valign="top" style="padding:11px 0;">
            <a href="https://gestion.pe/economia/empresas/marthans-director-del-bcrp-se-podria-preparar-un-reactiva-ante-el-nino-como-en-pandemia-noticia/" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">Nuevo director del BCRP plantea preparar un «Reactiva» a menor escala ante El Niño</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">Gestión · Perú · Política industrial y financiamiento</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">10</td>
          <td valign="top" style="padding:11px 0;">
            <a href="https://elcomercio.pe/economia/peru/gobierno-evalua-aplicar-la-suspension-perfecta-de-labores-ante-los-efectos-de-el-nino-que-dice-la-cgtp-al-respecto-apuesplan-noticia/" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">El Gobierno evalúa la suspensión perfecta de labores ante El Niño; la CGTP exige controles</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">El Comercio · Perú · MiPymes y empleo</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">11</td>
          <td valign="top" style="padding:11px 0;">
            <a href="https://www.elespectador.com/economia/macroeconomia/presupuesto-2027-ya-es-decreto-asi-se-distribuira-la-plata-del-estado/" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">El presupuesto 2027 de Colombia, de COP 634,95 billones, se expide por decreto tras un error de trámite</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">El Espectador · Colombia · Política industrial y coyuntura</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">12</td>
          <td valign="top" style="padding:11px 0;">
            <a href="https://www.eluniverso.com/economia/industrias/menos-captura-de-anchoveta-principalmente-en-peru-escala-precios-de-aceite-de-pescado-de-2500-a-mas-de-10000-por-tonelada-nota/" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">La menor pesca de anchoveta en Perú dispara el precio del aceite de pescado y presiona a los camaroneros ecuatorianos</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">El Universo · Ecuador y Perú · Agroindustria y cadenas de valor</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">13</td>
          <td valign="top" style="padding:11px 0;">
            <a href="https://www.eluniverso.com/economia/industrias/nueva-hidroelectrica-hidroquest-mina-fruta-del-norte-aporte-red-electrica-publica-ecuador-nota/" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">La hidroeléctrica Hidroquest (45 MW) entra al sistema de Ecuador; la mina Fruta del Norte cede su energía a la red pública</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">El Universo · Ecuador · Transición energética</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">14</td>
          <td valign="top" style="padding:11px 0;">
            <a href="https://www.eluniverso.com/economia/produccion/petroecuador-incorpora-pozo-activo-shushufindi-sucumbios-produccion-petrolera-ecuador-nota/" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">Petroecuador pone en producción el pozo más productivo del año en Ecuador, con 3.200 barriles diarios</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">El Universo · Ecuador · Energía</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">15</td>
          <td valign="top" style="padding:11px 0;">
            <a href="https://www.eluniverso.com/economia/industrias/viceministro-de-hidrocarburos-de-ecuador-se-reunio-con-representantes-de-pluspetrol-y-enap-de-chile-nota/" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">La chilena ENAP compra Pluspetrol Ecuador por US$ 207 millones; el Gobierno revisa la transacción del Bloque 10</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">El Universo · Ecuador · Inversión extranjera</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:11px 8px 11px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#9CB0C3;">16</td>
          <td valign="top" style="padding:11px 0;">
            <a href="https://andina.pe/agencia/noticia-cade-ejecutivos-2026-plantean-cinco-prioridades-para-desarrollo-del-peru-al-2050-1097037.aspx" style="font-size:14px; line-height:20px; font-weight:bold; color:#0067B1; text-decoration:none;">CADE Ejecutivos 2026: IPAE plantea cinco prioridades para el desarrollo del Perú al 2050</a>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:2px;">Andina · Perú · Política industrial</div>
          </td>
        </tr>
      </table>

    </td>
  </tr>

  <!-- INVESTIGACIÓN DESTACADA (OPCIONAL): hasta 5 publicaciones; eliminar la sección si no hay ninguna -->
  <tr>
    <td class="px" style="padding:26px 32px 8px 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:13px; line-height:18px; font-weight:bold; letter-spacing:1.5px; text-transform:uppercase; color:#00818A; border-bottom:2px solid #00818A; padding-bottom:6px;">Investigación destacada</div>
      <div style="font-size:11px; line-height:16px; color:#6B7B8B; padding-top:6px;">Artículos en revistas de alto impacto (Q1) y documentos de trabajo de BID, Banco Mundial, CEPAL, ONUDI y NBER publicados en los últimos 7 días.</div>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:13px 8px 13px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#7FC1C6;">1</td>
          <td valign="top" style="padding:13px 0;">
            <div style="font-size:11px; line-height:16px; padding-bottom:4px;">
              <span style="background-color:#E1EEFA; color:#003A70; padding:1px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
              <span style="background-color:#E0F2F3; color:#00666D; padding:1px 6px; border-radius:3px; font-weight:bold;">Regional</span>
              <span style="background-color:#EEF1F4; color:#4A5A6A; padding:1px 6px; border-radius:3px;">[pago]</span>
            </div>
            <a href="https://doi.org/10.1080/09692290.2026.2730217" style="font-size:15px; line-height:21px; font-weight:bold; color:#003A70; text-decoration:none;">Liderazgo segmentado: capital chino y estadounidense en la transición a energías renovables de Sudamérica</a>
            <div style="font-size:11px; line-height:15px; color:#8A98A6; font-style:italic; padding-top:2px;">Segmented leadership: Chinese and American capital in South America’s renewable energy transition</div>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:4px;">Agostinis et al. · <em>Review of International Political Economy</em> · 2026</div>
            <div style="font-size:13px; line-height:19px; color:#1F2D3A; padding-top:5px;"><strong style="color:#00818A;">Hallazgo principal:</strong> Con 194 proyectos (2006–2024), las empresas chinas dominan la hidroelectricidad y la eólica, y las estadounidenses el biodiésel y la solar avanzada; más que desplazarse, se especializan y amplían el financiamiento disponible para la región.</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:13px 8px 13px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#7FC1C6;">2</td>
          <td valign="top" style="padding:13px 0;">
            <div style="font-size:11px; line-height:16px; padding-bottom:4px;">
              <span style="background-color:#E1EEFA; color:#003A70; padding:1px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
              <span style="background-color:#E0F2F3; color:#00666D; padding:1px 6px; border-radius:3px; font-weight:bold;">Regional</span>
              <span style="background-color:#EEF1F4; color:#4A5A6A; padding:1px 6px; border-radius:3px;">Acceso abierto</span>
            </div>
            <a href="https://doi.org/10.1016/j.ecolecon.2026.109281" style="font-size:15px; line-height:21px; font-weight:bold; color:#003A70; text-decoration:none;">Política climática basada en la tierra, precios de la tierra y el trilema de la transición verde: evidencia de Bolivia</a>
            <div style="font-size:11px; line-height:15px; color:#8A98A6; font-style:italic; padding-top:2px;">Land-based climate policy, land prices, and the green transition trilemma: Evidence from Bolivia</div>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:4px;">Magacho et al. · <em>Ecological Economics</em> · 2026</div>
            <div style="font-size:13px; line-height:19px; color:#1F2D3A; padding-top:5px;"><strong style="color:#00818A;">Hallazgo principal:</strong> Las metas de conservación forestal y productividad agrícola de la NDC boliviana mejoran la actividad y el ambiente, pero encarecen la tierra y agravan los desequilibrios fiscales y externos.</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:13px 8px 13px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#7FC1C6;">3</td>
          <td valign="top" style="padding:13px 0;">
            <div style="font-size:11px; line-height:16px; padding-bottom:4px;">
              <span style="background-color:#E0F2F3; color:#00666D; padding:1px 6px; border-radius:3px; font-weight:bold;">Global</span>
              <span style="background-color:#EEF1F4; color:#4A5A6A; padding:1px 6px; border-radius:3px;">Acceso abierto</span>
              <span style="background-color:#EEF1F4; color:#4A5A6A; padding:1px 6px; border-radius:3px;">Documento de trabajo</span>
            </div>
            <a href="https://doi.org/10.18235/0014564" style="font-size:15px; line-height:21px; font-weight:bold; color:#003A70; text-decoration:none;">Cómo viajan los shocks: el impacto transfronterizo de los desastres naturales en las redes de empresas</a>
            <div style="font-size:11px; line-height:15px; color:#8A98A6; font-style:italic; padding-top:2px;">How Shocks Travel: The Cross-Border Impact of Natural Disasters in Firm Networks</div>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:4px;">Alviarez et al. · <em>BID</em> · 2026</div>
            <div style="font-size:13px; line-height:19px; color:#1F2D3A; padding-top:5px;"><strong style="color:#00818A;">Hallazgo principal:</strong> Los desastres naturales en países proveedores reducen hasta 25 puntos porcentuales el crecimiento de las compras de los importadores, y las redes internas de las multinacionales amortiguan ese golpe.</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:13px 8px 13px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#7FC1C6;">4</td>
          <td valign="top" style="padding:13px 0;">
            <div style="font-size:11px; line-height:16px; padding-bottom:4px;">
              <span style="background-color:#E0F2F3; color:#00666D; padding:1px 6px; border-radius:3px; font-weight:bold;">Global</span>
              <span style="background-color:#EEF1F4; color:#4A5A6A; padding:1px 6px; border-radius:3px;">Acceso abierto</span>
            </div>
            <a href="https://doi.org/10.1080/13563467.2026.2751101" style="font-size:15px; line-height:21px; font-weight:bold; color:#003A70; text-decoration:none;">La periferización de la industria europea de baterías: regímenes de reducción de riesgos, modelos productivos y la geografía de la política industrial verde</a>
            <div style="font-size:11px; line-height:15px; color:#8A98A6; font-style:italic; padding-top:2px;">The peripheralisation of Europe’s battery industry: derisking regimes, productive models, and the geography of green industrial policy</div>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:4px;">Karas · <em>New Political Economy</em> · 2026</div>
            <div style="font-size:13px; line-height:19px; color:#1F2D3A; padding-top:5px;"><strong style="color:#00818A;">Hallazgo principal:</strong> La fabricación de baterías prosperó en la periferia europea, donde el Estado absorbió los riesgos de inversión, muchas veces integrándose con empresas chinas en lugar de buscar autonomía estratégica.</div>
          </td>
        </tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #DCE6EF;">
        <tr>
          <td width="30" valign="top" style="padding:13px 8px 13px 0; font-family:Georgia, 'Times New Roman', serif; font-size:15px; line-height:21px; font-weight:bold; color:#7FC1C6;">5</td>
          <td valign="top" style="padding:13px 0;">
            <div style="font-size:11px; line-height:16px; padding-bottom:4px;">
              <span style="background-color:#E0F2F3; color:#00666D; padding:1px 6px; border-radius:3px; font-weight:bold;">Global</span>
              <span style="background-color:#EEF1F4; color:#4A5A6A; padding:1px 6px; border-radius:3px;">[pago]</span>
            </div>
            <a href="https://doi.org/10.1080/09692290.2026.2748311" style="font-size:15px; line-height:21px; font-weight:bold; color:#003A70; text-decoration:none;">Capacidad estatal situacional para una política industrial transformadora en economías de mercado dependientes</a>
            <div style="font-size:11px; line-height:15px; color:#8A98A6; font-style:italic; padding-top:2px;">Situational state capacity for transformative industrial policy in dependent market economies</div>
            <div style="font-size:12px; line-height:17px; color:#6B7B8B; padding-top:4px;">Kalanta et al. · <em>Review of International Political Economy</em> · 2026</div>
            <div style="font-size:13px; line-height:19px; color:#1F2D3A; padding-top:5px;"><strong style="color:#00818A;">Hallazgo principal:</strong> Propone un marco de capacidad estatal, basado en una mentalidad desarrollista y la movilización política, y lo ilustra con la transferencia de tecnología de semiconductores de Taiwán a Lituania.</div>
          </td>
        </tr>
      </table>

    </td>
  </tr>

  <!-- NOTA DE MÉTODO -->
  <tr>
    <td class="px" style="padding:20px 32px 24px 32px; font-family:Arial, Helvetica, sans-serif; font-size:11px; line-height:17px; color:#6B7B8B;">
      Noticias publicadas entre el jueves 22 de octubre, 07:01 y el viernes 23 de octubre de 2026, 07:00 (hora de Lima, Bogotá y Quito), identificadas mediante búsqueda asistida por IA en fuentes oficiales de gobierno, organismos nacionales e internacionales y medios verificados (español, inglés y portugués). Cada enlace fue comprobado. Titulares traducidos al español cuando la fuente está en otro idioma. La difusión indica cuántas fuentes independientes cubrieron la noticia.
    </td>
  </tr>

  <!-- PIE -->
  <tr>
    <td style="padding:0; font-size:0; line-height:0;">
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="20%" height="4" style="background-color:#A7D8F0; font-size:0; line-height:0;">&nbsp;</td>
          <td width="20%" height="4" style="background-color:#5BC2E7; font-size:0; line-height:0;">&nbsp;</td>
          <td width="20%" height="4" style="background-color:#009EDB; font-size:0; line-height:0;">&nbsp;</td>
          <td width="20%" height="4" style="background-color:#0067B1; font-size:0; line-height:0;">&nbsp;</td>
          <td width="20%" height="4" style="background-color:#003A70; font-size:0; line-height:0;">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td class="px" style="background-color:#003A70; padding:20px 32px; font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:18px; color:#DCE9F5;">
      <strong style="color:#ffffff;">Radar Regional</strong> — Oficina Andina de ONUDI (Colombia, Perú, Bolivia, Ecuador)<br>
      <a href="https://isacoli.github.io/radar-regional/" style="color:#ffffff; font-weight:bold;">Edición más reciente</a> · <a href="https://isacoli.github.io/radar-regional/archivo/" style="color:#ffffff;">Archivo de ediciones</a> · <a href="https://isacoli.github.io/radar-regional/buscar/" style="color:#ffffff;">Buscador</a><br>
      ¿Tiene una noticia para el próximo número? Responda a este correo.<br>
      <span style="color:#A7D8F0;">Las noticias y publicaciones de terceros se enlazan con su fuente y no reflejan necesariamente la posición de ONUDI.</span>
    </td>
  </tr>

</table>

</td></tr>
</table>
</body>
</html>
$q$,16,5);
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,1,true,$q$El Senado de Bolivia aprueba un crédito del BID de US$ 30,2 millones para alumbrado público LED$q$,$q$El préstamo, a 19,6 años, financiará luminarias LED y sistemas inteligentes de medición en municipios bolivianos; la ley pasa al Ejecutivo para su promulgación.$q$,null,$q$https://www.opinion.com.bo/pais/senado-aprueba-credito-bid-us-302-millones-modernizar-alumbrado-publico/20261022191207998045.html$q$,$q$ABI (vía Opinión)$q$,$q$Bolivia$q$,$q$Transición energética$q$,null,true,false,5,3,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,2,true,$q$La UE y la SNI lanzan un fondo de 550.000 euros para proyectos de industria circular en ocho regiones de Perú$q$,$q$La segunda convocatoria cubre hasta el 70 % de 30 proyectos de empresas textiles y de plásticos, y amplía la cobertura de tres a ocho regiones.$q$,null,$q$https://sni.org.pe/ue-y-sni-lanzan-nuevo-fondo-de-550-mil-euros-para-impulsar-la-industria-circular-en-ocho-regiones-del-peru/$q$,$q$Sociedad Nacional de Industrias$q$,$q$Perú$q$,$q$Industria verde y economía circular$q$,null,false,true,2,5,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,3,true,$q$Ecuador y Bolivia firman un memorando y crean una Comisión Binacional para impulsar el comercio y las inversiones$q$,$q$La comisión identificará oportunidades de intercambio e inversión y organizará misiones empresariales para conectar la oferta exportable con compradores, con foco en pequeños productores.$q$,null,$q$https://www.eluniverso.com/economia/industrias/acuerdo-bilateral-creacion-comision-binacional-comercio-exterior-exportaciones-bolivia-ecuador-2026-nota/$q$,$q$El Universo$q$,$q$Ecuador y Bolivia$q$,$q$Inversión y comercio$q$,null,false,true,1,5,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,4,true,$q$Promigas: la falta de señales regulatorias frena proyectos de gas natural por US$ 3.936 millones en Perú$q$,$q$Las nuevas conexiones de gas cayeron de 279.000 en 2024 a 147.000 en 2025; los proyectos pendientes llevarían el servicio a más de 1,5 millones de peruanos.$q$,null,$q$https://gestion.pe/economia/proyectos-de-gas-natural-por-us3936-millones-dependen-de-senales-regulatorias-noticia/$q$,$q$Gestión$q$,$q$Perú$q$,$q$Energía e infraestructura$q$,null,false,true,1,4,$q$2026-10-23$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,5,true,$q$Los vehículos de origen chino captan casi el 57 % de las ventas en Ecuador; la industria local pide incentivos$q$,$q$Las ventas de vehículos nuevos crecieron 40,3 % hasta septiembre; los ensambladores locales, con 11–12 % del mercado, piden menos impuestos para autos con más partes nacionales.$q$,null,$q$https://www.eluniverso.com/economia/industrias/venta-vehiculos-origen-china-568-reporte-aeade-de-enero-a-septiembre-ecuador-2026-nota/$q$,$q$El Universo$q$,$q$Ecuador$q$,$q$Inversión y comercio$q$,null,false,true,1,4,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,6,false,$q$Banco de la República: la economía de todas las regiones perdió fuerza en el tercer trimestre; la industria, golpeada por el sismo y la baja demanda$q$,null,null,$q$https://www.elespectador.com/economia/macroeconomia/economia-regional-el-consumo-resistio-pero-la-industria-y-la-vivienda-perdieron-fuerza/$q$,$q$El Espectador$q$,$q$Colombia$q$,$q$Política industrial y coyuntura$q$,null,false,true,1,4,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,7,false,$q$Colombia y EE. UU. avanzan hacia un acuerdo para retirar el arancel del 12,5 %; la firma se prevé para diciembre$q$,null,null,$q$https://www.elespectador.com/economia/macroeconomia/estados-unidos-quitara-los-aranceles-a-bienes-colombianos-asi-van-las-negociaciones/$q$,$q$El Espectador$q$,$q$Colombia$q$,$q$Inversión y comercio$q$,null,false,false,1,4,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,8,false,$q$Así se construye el Plan Nacional de Desarrollo 2026-2030: meta de crecer 6 % con más inversión y productividad$q$,null,null,$q$https://www.elespectador.com/economia/asi-se-esta-construyendo-el-plan-nacional-de-desarrollo-del-gobierno-de-la-espriella/$q$,$q$El Espectador$q$,$q$Colombia$q$,$q$Política industrial$q$,null,false,false,1,4,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,9,false,$q$Nuevo director del BCRP plantea preparar un «Reactiva» a menor escala ante El Niño$q$,null,null,$q$https://gestion.pe/economia/empresas/marthans-director-del-bcrp-se-podria-preparar-un-reactiva-ante-el-nino-como-en-pandemia-noticia/$q$,$q$Gestión$q$,$q$Perú$q$,$q$Política industrial y financiamiento$q$,null,false,false,1,4,$q$2026-10-23$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,10,false,$q$El Gobierno evalúa la suspensión perfecta de labores ante El Niño; la CGTP exige controles$q$,null,null,$q$https://elcomercio.pe/economia/peru/gobierno-evalua-aplicar-la-suspension-perfecta-de-labores-ante-los-efectos-de-el-nino-que-dice-la-cgtp-al-respecto-apuesplan-noticia/$q$,$q$El Comercio$q$,$q$Perú$q$,$q$MiPymes y empleo$q$,null,false,false,1,3,$q$2026-10-23$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,11,false,$q$El presupuesto 2027 de Colombia, de COP 634,95 billones, se expide por decreto tras un error de trámite$q$,null,null,$q$https://www.elespectador.com/economia/macroeconomia/presupuesto-2027-ya-es-decreto-asi-se-distribuira-la-plata-del-estado/$q$,$q$El Espectador$q$,$q$Colombia$q$,$q$Política industrial y coyuntura$q$,null,false,false,1,3,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,12,false,$q$La menor pesca de anchoveta en Perú dispara el precio del aceite de pescado y presiona a los camaroneros ecuatorianos$q$,null,null,$q$https://www.eluniverso.com/economia/industrias/menos-captura-de-anchoveta-principalmente-en-peru-escala-precios-de-aceite-de-pescado-de-2500-a-mas-de-10000-por-tonelada-nota/$q$,$q$El Universo$q$,$q$Ecuador y Perú$q$,$q$Agroindustria y cadenas de valor$q$,null,false,false,1,3,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,13,false,$q$La hidroeléctrica Hidroquest (45 MW) entra al sistema de Ecuador; la mina Fruta del Norte cede su energía a la red pública$q$,null,null,$q$https://www.eluniverso.com/economia/industrias/nueva-hidroelectrica-hidroquest-mina-fruta-del-norte-aporte-red-electrica-publica-ecuador-nota/$q$,$q$El Universo$q$,$q$Ecuador$q$,$q$Transición energética$q$,null,false,false,1,3,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,14,false,$q$Petroecuador pone en producción el pozo más productivo del año en Ecuador, con 3.200 barriles diarios$q$,null,null,$q$https://www.eluniverso.com/economia/produccion/petroecuador-incorpora-pozo-activo-shushufindi-sucumbios-produccion-petrolera-ecuador-nota/$q$,$q$El Universo$q$,$q$Ecuador$q$,$q$Energía$q$,null,false,false,1,3,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,15,false,$q$La chilena ENAP compra Pluspetrol Ecuador por US$ 207 millones; el Gobierno revisa la transacción del Bloque 10$q$,null,null,$q$https://www.eluniverso.com/economia/industrias/viceministro-de-hidrocarburos-de-ecuador-se-reunio-con-representantes-de-pluspetrol-y-enap-de-chile-nota/$q$,$q$El Universo$q$,$q$Ecuador$q$,$q$Inversión extranjera$q$,null,false,false,1,3,$q$2026-10-22$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,16,false,$q$CADE Ejecutivos 2026: IPAE plantea cinco prioridades para el desarrollo del Perú al 2050$q$,null,null,$q$https://andina.pe/agencia/noticia-cade-ejecutivos-2026-plantean-cinco-prioridades-para-desarrollo-del-peru-al-2050-1097037.aspx$q$,$q$Andina$q$,$q$Perú$q$,$q$Política industrial$q$,null,false,false,1,3,$q$2026-10-23$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.investigaciones (edicion_id,posicion,titulo_es,titulo_original,autores,revista,tipo,ambito,acceso_abierto,mas_relevante,hallazgo,url,fecha_publicacion,ranking) select id,1,$q$Liderazgo segmentado: capital chino y estadounidense en la transición a energías renovables de Sudamérica$q$,$q$Segmented leadership: Chinese and American capital in South America’s renewable energy transition$q$,$q$Agostinis et al.$q$,$q$Review of International Political Economy$q$,$q$articulo$q$,$q$Regional$q$,false,true,$q$Con 194 proyectos (2006–2024), las empresas chinas dominan la hidroelectricidad y la eólica, y las estadounidenses el biodiésel y la solar avanzada; más que desplazarse, se especializan y amplían el financiamiento disponible para la región.$q$,$q$https://doi.org/10.1080/09692290.2026.2730217$q$,$q$2026-10-22$q$,$q$JCR Q1 (Journal Metrics)$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.investigaciones (edicion_id,posicion,titulo_es,titulo_original,autores,revista,tipo,ambito,acceso_abierto,mas_relevante,hallazgo,url,fecha_publicacion,ranking) select id,2,$q$Política climática basada en la tierra, precios de la tierra y el trilema de la transición verde: evidencia de Bolivia$q$,$q$Land-based climate policy, land prices, and the green transition trilemma: Evidence from Bolivia$q$,$q$Magacho et al.$q$,$q$Ecological Economics$q$,$q$articulo$q$,$q$Regional$q$,true,true,$q$Las metas de conservación forestal y productividad agrícola de la NDC boliviana mejoran la actividad y el ambiente, pero encarecen la tierra y agravan los desequilibrios fiscales y externos.$q$,$q$https://doi.org/10.1016/j.ecolecon.2026.109281$q$,$q$2026-10-22$q$,$q$SJR Q1 (Economía; Ciencias Ambientales) y JCR Q1$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.investigaciones (edicion_id,posicion,titulo_es,titulo_original,autores,revista,tipo,ambito,acceso_abierto,mas_relevante,hallazgo,url,fecha_publicacion,ranking) select id,3,$q$Cómo viajan los shocks: el impacto transfronterizo de los desastres naturales en las redes de empresas$q$,$q$How Shocks Travel: The Cross-Border Impact of Natural Disasters in Firm Networks$q$,$q$Alviarez et al.$q$,$q$BID$q$,$q$documento_de_trabajo$q$,$q$Global$q$,true,false,$q$Los desastres naturales en países proveedores reducen hasta 25 puntos porcentuales el crecimiento de las compras de los importadores, y las redes internas de las multinacionales amortiguan ese golpe.$q$,$q$https://doi.org/10.18235/0014564$q$,$q$2026-10-16$q$,$q$Documento de trabajo BID$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.investigaciones (edicion_id,posicion,titulo_es,titulo_original,autores,revista,tipo,ambito,acceso_abierto,mas_relevante,hallazgo,url,fecha_publicacion,ranking) select id,4,$q$La periferización de la industria europea de baterías: regímenes de reducción de riesgos, modelos productivos y la geografía de la política industrial verde$q$,$q$The peripheralisation of Europe’s battery industry: derisking regimes, productive models, and the geography of green industrial policy$q$,$q$Karas$q$,$q$New Political Economy$q$,$q$articulo$q$,$q$Global$q$,true,false,$q$La fabricación de baterías prosperó en la periferia europea, donde el Estado absorbió los riesgos de inversión, muchas veces integrándose con empresas chinas en lugar de buscar autonomía estratégica.$q$,$q$https://doi.org/10.1080/13563467.2026.2751101$q$,$q$2026-10-21$q$,$q$SJR Q1 (Desarrollo; Ciencia Política) y JCR Q1$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
insert into public.investigaciones (edicion_id,posicion,titulo_es,titulo_original,autores,revista,tipo,ambito,acceso_abierto,mas_relevante,hallazgo,url,fecha_publicacion,ranking) select id,5,$q$Capacidad estatal situacional para una política industrial transformadora en economías de mercado dependientes$q$,$q$Situational state capacity for transformative industrial policy in dependent market economies$q$,$q$Kalanta et al.$q$,$q$Review of International Political Economy$q$,$q$articulo$q$,$q$Global$q$,false,false,$q$Propone un marco de capacidad estatal, basado en una mentalidad desarrollista y la movilización política, y lo ilustra con la transferencia de tecnología de semiconductores de Taiwán a Lituania.$q$,$q$https://doi.org/10.1080/09692290.2026.2748311$q$,$q$2026-10-20$q$,$q$JCR Q1 (Journal Metrics)$q$ from public.ediciones where slug=$q$diario-2026-10-23$q$;
delete from public.ediciones where slug=$q$semanal-2026-10-23$q$;
insert into public.ediciones (slug,tipo,numero,fecha,ventana_inicio,ventana_fin,titulo,resumen,url_web,html,n_noticias,n_investigaciones) values ($q$semanal-2026-10-23$q$,$q$semanal$q$,1,$q$2026-10-23$q$,$q$2026-10-16T00:00:00-05:00$q$,$q$2026-10-23T00:00:00-05:00$q$,$q$Radar Regional N.º 1 · Semana del 16 al 23 de octubre de 2026$q$,$q$Esta semana la integración andina gana impulso con los acuerdos entre Perú y Ecuador y la nueva presidencia peruana de la Comunidad Andina, mientras Chancay consolida su papel logístico. En contraste, la industria colombiana sigue en retroceso y Ecuador espera normalizar el suministro eléctrico a las empresas. También destacan nuevas referencias regionales en inteligencia artificial, litio y economía circular.$q$,null,$q$<!DOCTYPE html>
<html lang="es" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="x-apple-disable-message-reformatting">
<meta name="color-scheme" content="light">
<meta name="supported-color-schemes" content="light">
<title>Radar Regional · Semana del 16 al 23 de octubre de 2026</title>
<style>
  body { margin:0; padding:0; }
  a { color:#0b3d66; }
  @media only screen and (max-width:620px) {
    .container { width:100% !important; }
    .px { padding-left:20px !important; padding-right:20px !important; }
  }
</style>
</head>
<body style="margin:0; padding:0; background-color:#eef2f6;">

<div style="display:none; max-height:0; overflow:hidden; mso-hide:all; font-size:1px; line-height:1px; color:#eef2f6;">
  Perú y Ecuador firman acuerdos, Chancay crece 82 %, Chile acelera el litio y más: lo más destacado de la semana.
</div>

<table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#eef2f6;">
<tr><td align="center" style="padding:24px 12px;">

<table role="presentation" class="container" width="600" cellpadding="0" cellspacing="0" border="0" style="width:600px; max-width:600px; background-color:#ffffff; border-radius:6px; overflow:hidden;">

  <!-- ENCABEZADO -->
  <tr>
    <td class="px" style="background-color:#0b3d66; padding:26px 32px 22px 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:12px; line-height:16px; letter-spacing:1.5px; text-transform:uppercase; color:#9cc7ea;">Oficina Andina de ONUDI · Uso interno</div>
      <div style="font-size:24px; line-height:30px; font-weight:bold; color:#ffffff; padding-top:6px;">Radar Regional</div>
      <div style="font-size:13px; line-height:18px; color:#cfe2f3; padding-top:4px;">N.º 1 · Semana del 16 al 23 de octubre de 2026</div>
    </td>
  </tr>

  <!-- INTRODUCCIÓN -->
  <tr>
    <td class="px" style="padding:26px 32px 6px 32px; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:23px; color:#2b3a49;">
      Esta semana la integración andina gana impulso con los acuerdos entre Perú y Ecuador y la nueva presidencia peruana de la Comunidad Andina, mientras Chancay consolida su papel logístico. En contraste, la industria colombiana sigue en retroceso y Ecuador espera normalizar el suministro eléctrico a las empresas. También destacan nuevas referencias regionales en inteligencia artificial, litio y economía circular.
    </td>
  </tr>

  <!-- LEYENDA DE ETIQUETAS -->
  <tr>
    <td class="px" style="padding:8px 32px 4px 32px; font-family:Arial, Helvetica, sans-serif; font-size:11px; line-height:16px; color:#6b7b8b;">
      <span style="background-color:#fdebd8; color:#9a4a00; padding:2px 6px; border-radius:3px; font-weight:bold;">🔥 Más difundida</span>&nbsp;cubierta por más medios&nbsp;&nbsp;
      <span style="background-color:#e1eefa; color:#0b3d66; padding:2px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>&nbsp;mayor interés para la oficina
    </td>
  </tr>

  <!-- CATEGORÍA: INTEGRACIÓN Y COMERCIO -->
  <tr>
    <td class="px" style="padding:24px 32px 0 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:12px; line-height:16px; font-weight:bold; letter-spacing:1.2px; text-transform:uppercase; color:#0b3d66; border-bottom:2px solid #0b3d66; padding-bottom:6px;">Inversión, comercio e integración</div>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #e1e7ed;">
        <tr><td style="padding:16px 0;">
          <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
            <span style="background-color:#fdebd8; color:#9a4a00; padding:2px 6px; border-radius:3px; font-weight:bold;">🔥 Más difundida</span>
            <span style="background-color:#e1eefa; color:#0b3d66; padding:2px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
            <span style="color:#1a7a6a; font-weight:bold; padding-left:4px;">Oportunidad</span>
          </div>
          <a href="https://www.eluniverso.com/politica/ejecutivo/ecuador-y-peru-firman-acuerdos-de-cooperacion-en-seguridad-energia-y-desarrollo-fronterizo-nota/" style="font-family:Georgia, 'Times New Roman', serif; font-size:18px; line-height:24px; font-weight:bold; color:#0b3d66; text-decoration:none;">Perú y Ecuador firman acuerdos en energía, pesca y desarrollo fronterizo; Perú asume la presidencia de la CAN</a>
          <div style="font-size:12px; line-height:18px; color:#6b7b8b; padding-top:4px;">El Universo · 20 oct 2026 · Perú y Ecuador</div>
          <p style="margin:10px 0 0 0; font-size:15px; line-height:23px; color:#2b3a49;">En el XVII Gabinete Binacional, celebrado en Lima el 20 de octubre, los presidentes Daniel Noboa y Keiko Fujimori adoptaron el Plan de Acción de Lima. Petroecuador y Petroperú firmaron un memorando para cooperar en exploración y comercialización de hidrocarburos y en el uso conjunto de su capacidad de refinación y transporte; ambos países también acordaron combatir la pesca ilegal. En el mismo encuentro, Perú recibió la presidencia pro tempore de la Comunidad Andina para 2026-2027, con prioridades en comercio, inversión y conectividad aérea y portuaria.</p>
          <p style="margin:8px 0 0 0; font-size:14px; line-height:21px; color:#2b3a49;"><strong style="color:#1a7a6a;">Por qué importa:</strong> Define la agenda de integración andina del próximo año y abre espacio a proyectos binacionales de energía e industria.</p>
          <p style="margin:10px 0 0 0; font-size:14px; line-height:20px;"><a href="https://www.eluniverso.com/politica/ejecutivo/ecuador-y-peru-firman-acuerdos-de-cooperacion-en-seguridad-energia-y-desarrollo-fronterizo-nota/" style="color:#0a5c99; font-weight:bold; text-decoration:underline;">Leer la noticia completa en El Universo &rarr;</a><br>
          <a href="https://forbes.pe/actualidad/2026-10-20/peru-asume-la-presidencia-de-la-comunidad-andina-para-el-periodo-2026-2027" style="color:#0a5c99; font-size:13px; text-decoration:underline;">Sobre la presidencia de la CAN, en Forbes Perú &rarr;</a></p>
        </td></tr>
      </table>
    </td>
  </tr>

  <!-- CATEGORÍA: INNOVACIÓN -->
  <tr>
    <td class="px" style="padding:24px 32px 0 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:12px; line-height:16px; font-weight:bold; letter-spacing:1.2px; text-transform:uppercase; color:#0b3d66; border-bottom:2px solid #0b3d66; padding-bottom:6px;">Innovación, digitalización y MiPymes</div>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #e1e7ed;">
        <tr><td style="padding:16px 0;">
          <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
            <span style="background-color:#fdebd8; color:#9a4a00; padding:2px 6px; border-radius:3px; font-weight:bold;">🔥 Más difundida</span>
            <span style="background-color:#e1eefa; color:#0b3d66; padding:2px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
            <span style="color:#1a7a6a; font-weight:bold; padding-left:4px;">Benchmarking</span>
          </div>
          <a href="https://www.bloomberglinea.com/tecnologia/los-paises-de-america-latina-mas-preparados-para-la-inteligencia-artificial-segun-ranking-de-cepal/" style="font-family:Georgia, 'Times New Roman', serif; font-size:18px; line-height:24px; font-weight:bold; color:#0b3d66; text-decoration:none;">Índice Latinoamericano de IA 2026: Colombia 4.ª, Perú 7.º, Ecuador 9.º y Bolivia 18.ª</a>
          <div style="font-size:12px; line-height:18px; color:#6b7b8b; padding-top:4px;">Bloomberg Línea · 22 oct 2026 · Regional</div>
          <p style="margin:10px 0 0 0; font-size:15px; line-height:23px; color:#2b3a49;">La CEPAL y el Centro Nacional de Inteligencia Artificial de Chile (CENIA) presentaron la edición 2026 del Índice Latinoamericano de Inteligencia Artificial (ILIA), que evalúa a 20 países en condiciones habilitantes, investigación y adopción, y gobernanza. Chile, Brasil y Uruguay encabezan la tabla. Colombia es cuarta (56,8 puntos), Perú séptimo (52,7), Ecuador noveno (51,8) y Bolivia ocupa el puesto 18 (26,4). La brecha empresarial es amplia: usa IA el 27,6 % de las grandes empresas, pero solo el 6,8 % de las pequeñas.</p>
          <p style="margin:8px 0 0 0; font-size:14px; line-height:21px; color:#2b3a49;"><strong style="color:#1a7a6a;">Por qué importa:</strong> Ofrece una línea de base comparable para medir la brecha digital de la industria y las pymes andinas y orientar programas de Industria 4.0.</p>
          <p style="margin:10px 0 0 0; font-size:14px; line-height:20px;"><a href="https://www.bloomberglinea.com/tecnologia/los-paises-de-america-latina-mas-preparados-para-la-inteligencia-artificial-segun-ranking-de-cepal/" style="color:#0a5c99; font-weight:bold; text-decoration:underline;">Leer la noticia completa en Bloomberg Línea &rarr;</a></p>
        </td></tr>
      </table>
    </td>
  </tr>

  <!-- CATEGORÍA: POLÍTICA INDUSTRIAL -->
  <tr>
    <td class="px" style="padding:24px 32px 0 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:12px; line-height:16px; font-weight:bold; letter-spacing:1.2px; text-transform:uppercase; color:#0b3d66; border-bottom:2px solid #0b3d66; padding-bottom:6px;">Política industrial y coyuntura</div>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #e1e7ed;">
        <tr><td style="padding:16px 0;">
          <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
            <span style="background-color:#fdebd8; color:#9a4a00; padding:2px 6px; border-radius:3px; font-weight:bold;">🔥 Más difundida</span>
            <span style="color:#1a7a6a; font-weight:bold; padding-left:4px;">Contexto</span>
          </div>
          <a href="https://rpp.pe/economia/economia/mef-anuncia-s-2500-millones-en-bonos-para-familias-vulnerables-ante-el-fenomeno-el-nino-quienes-los-recibiran-noticia-1713896" style="font-family:Georgia, 'Times New Roman', serif; font-size:18px; line-height:24px; font-weight:bold; color:#0b3d66; text-decoration:none;">Perú lanza un paquete de S/ 18.000 millones frente a El Niño, con alivio tributario y liquidez para empresas</a>
          <div style="font-size:12px; line-height:18px; color:#6b7b8b; padding-top:4px;">RPP · 22 oct 2026 · Perú</div>
          <p style="margin:10px 0 0 0; font-size:15px; line-height:23px; color:#2b3a49;">El Ministerio de Economía y Finanzas anunció S/ 18.000 millones adicionales para 2027 para amortiguar el impacto de El Niño, el alza del petróleo y las tasas internacionales. Incluye S/ 2.500 millones en bonos temporales para familias vulnerables y S/ 13.000 millones para infraestructura. Para las empresas afectadas prevé aplazar obligaciones tributarias, liberar saldos de detracciones y ofrecer préstamos, además de priorizar 250 obras con más del 50 % de avance. Aún no se detallan los requisitos de acceso.</p>
          <p style="margin:8px 0 0 0; font-size:14px; line-height:21px; color:#2b3a49;"><strong style="color:#1a7a6a;">Por qué importa:</strong> Impacta a las mypes y cadenas productivas del norte y del sur andino, y es un caso de respuesta económica a choques climáticos útil para toda la región.</p>
          <p style="margin:10px 0 0 0; font-size:14px; line-height:20px;"><a href="https://rpp.pe/economia/economia/mef-anuncia-s-2500-millones-en-bonos-para-familias-vulnerables-ante-el-fenomeno-el-nino-quienes-los-recibiran-noticia-1713896" style="color:#0a5c99; font-weight:bold; text-decoration:underline;">Leer la noticia completa en RPP &rarr;</a></p>
        </td></tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #e1e7ed;">
        <tr><td style="padding:16px 0;">
          <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
            <span style="background-color:#e1eefa; color:#0b3d66; padding:2px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
            <span style="color:#1a7a6a; font-weight:bold; padding-left:4px;">Contexto</span>
          </div>
          <a href="https://www.semana.com/economia/articulo/caida-en-produccion-manufacturera-preocupa-al-gremio-empresarial/202639/" style="font-family:Georgia, 'Times New Roman', serif; font-size:18px; line-height:24px; font-weight:bold; color:#0b3d66; text-decoration:none;">La industria manufacturera colombiana cae 3,7 % en agosto y la ANDI pide reactivar sectores estratégicos</a>
          <div style="font-size:12px; line-height:18px; color:#6b7b8b; padding-top:4px;">Semana · 16 oct 2026 · Colombia</div>
          <p style="margin:10px 0 0 0; font-size:15px; line-height:23px; color:#2b3a49;">Según el DANE, la producción manufacturera de Colombia cayó 3,7 % y las ventas 3,5 % en agosto frente al mismo mes de 2025, el segundo mes seguido de retroceso. De 39 subsectores, 29 registraron caídas, las mayores en caucho, cuero, impresión, químicos básicos y confección. En lo que va del año la industria crece apenas 0,4 %. La ANDI pidió recuperar la confianza y reactivar la infraestructura, la construcción, el agro y la minería.</p>
          <p style="margin:8px 0 0 0; font-size:14px; line-height:21px; color:#2b3a49;"><strong style="color:#1a7a6a;">Por qué importa:</strong> Es un termómetro del momento de la industria colombiana y señala los subsectores que más necesitan apoyo en competitividad.</p>
          <p style="margin:10px 0 0 0; font-size:14px; line-height:20px;"><a href="https://www.semana.com/economia/articulo/caida-en-produccion-manufacturera-preocupa-al-gremio-empresarial/202639/" style="color:#0a5c99; font-weight:bold; text-decoration:underline;">Leer la noticia completa en Semana &rarr;</a></p>
        </td></tr>
      </table>
    </td>
  </tr>

  <!-- CATEGORÍA: MEGAPROYECTOS -->
  <tr>
    <td class="px" style="padding:24px 32px 0 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:12px; line-height:16px; font-weight:bold; letter-spacing:1.2px; text-transform:uppercase; color:#0b3d66; border-bottom:2px solid #0b3d66; padding-bottom:6px;">Megaproyectos e infraestructura</div>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #e1e7ed;">
        <tr><td style="padding:16px 0;">
          <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
            <span style="background-color:#fdebd8; color:#9a4a00; padding:2px 6px; border-radius:3px; font-weight:bold;">🔥 Más difundida</span>
            <span style="background-color:#e1eefa; color:#0b3d66; padding:2px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
            <span style="color:#1a7a6a; font-weight:bold; padding-left:4px;">Oportunidad</span>
          </div>
          <a href="https://forbes.pe/economia-y-finanzas/2026-10-19/puerto-de-chancay-apunta-a-movilizar-mas-de-422-000-contenedores-en-2026-proyecta-la-ccl" style="font-family:Georgia, 'Times New Roman', serif; font-size:18px; line-height:24px; font-weight:bold; color:#0b3d66; text-decoration:none;">El puerto de Chancay podría superar los 422.000 TEU en 2026, un 82,5 % más que en 2025</a>
          <div style="font-size:12px; line-height:18px; color:#6b7b8b; padding-top:4px;">Forbes Perú · 19 oct 2026 · Perú</div>
          <p style="margin:10px 0 0 0; font-size:15px; line-height:23px; color:#2b3a49;">Según la Cámara de Comercio de Lima, el puerto de Chancay movilizó 246.452 TEU entre enero y julio de 2026, más que en todo 2025, y podría cerrar el año por encima de 422.000 TEU. Su participación en el tráfico nacional de contenedores pasó del 5,6 % al 10,1 %, aunque el Callao sigue concentrando casi el 80 %. La ruta marítima directa a China, de unos 25 días, es su principal atractivo para exportadores e importadores.</p>
          <p style="margin:8px 0 0 0; font-size:14px; line-height:21px; color:#2b3a49;"><strong style="color:#1a7a6a;">Por qué importa:</strong> Chancay está reconfigurando las rutas logísticas del Pacífico sudamericano y abre nuevas opciones de exportación para la industria de los cuatro países andinos.</p>
          <p style="margin:10px 0 0 0; font-size:14px; line-height:20px;"><a href="https://forbes.pe/economia-y-finanzas/2026-10-19/puerto-de-chancay-apunta-a-movilizar-mas-de-422-000-contenedores-en-2026-proyecta-la-ccl" style="color:#0a5c99; font-weight:bold; text-decoration:underline;">Leer la noticia completa en Forbes Perú &rarr;</a></p>
        </td></tr>
      </table>
    </td>
  </tr>

  <!-- CATEGORÍA: ENERGÍA Y MINERALES CRÍTICOS -->
  <tr>
    <td class="px" style="padding:24px 32px 0 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:12px; line-height:16px; font-weight:bold; letter-spacing:1.2px; text-transform:uppercase; color:#0b3d66; border-bottom:2px solid #0b3d66; padding-bottom:6px;">Energía y minerales críticos</div>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #e1e7ed;">
        <tr><td style="padding:16px 0;">
          <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
            <span style="background-color:#fdebd8; color:#9a4a00; padding:2px 6px; border-radius:3px; font-weight:bold;">🔥 Más difundida</span>
            <span style="color:#1a7a6a; font-weight:bold; padding-left:4px;">Benchmarking</span>
          </div>
          <a href="https://es.marketscreener.com/noticias/chile-buscar-impulsar-nuevos-proyectos-de-litio-para-m-s-que-duplicar-producci-n-ministro-ce785cd9d88af722" style="font-family:Georgia, 'Times New Roman', serif; font-size:18px; line-height:24px; font-weight:bold; color:#0b3d66; text-decoration:none;">Chile prevé licitar unos cinco nuevos proyectos de litio para más que duplicar su producción</a>
          <div style="font-size:12px; line-height:18px; color:#6b7b8b; padding-top:4px;">Reuters (vía MarketScreener) · 21 oct 2026 · Chile</div>
          <p style="margin:10px 0 0 0; font-size:15px; line-height:23px; color:#2b3a49;">El ministro de Minería de Chile, Daniel Mas, afirmó en Londres que el país licitará unos cinco nuevos proyectos de litio a comienzos del próximo año, además de otros cinco que están en aprobación final y serán operados íntegramente por privados. La meta es pasar de unas 300.000 a 700.000 toneladas en un plazo de cinco a diez años. El gobierno de José Antonio Kast apuesta por el liderazgo privado y por acortar los permisos, a diferencia del mayor control estatal que buscaba la administración anterior.</p>
          <p style="margin:8px 0 0 0; font-size:14px; line-height:21px; color:#2b3a49;"><strong style="color:#1a7a6a;">Por qué importa:</strong> Es una referencia directa para Bolivia, que debate su propia ley del litio y el papel del Estado y de los privados en el sector.</p>
          <p style="margin:10px 0 0 0; font-size:14px; line-height:20px;"><a href="https://es.marketscreener.com/noticias/chile-buscar-impulsar-nuevos-proyectos-de-litio-para-m-s-que-duplicar-producci-n-ministro-ce785cd9d88af722" style="color:#0a5c99; font-weight:bold; text-decoration:underline;">Leer la noticia completa en MarketScreener (Reuters) &rarr;</a></p>
        </td></tr>
      </table>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #e1e7ed;">
        <tr><td style="padding:16px 0;">
          <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
            <span style="background-color:#e1eefa; color:#0b3d66; padding:2px 6px; border-radius:3px; font-weight:bold;">⭐ Más relevante</span>
            <span style="color:#1a7a6a; font-weight:bold; padding-left:4px;">Contexto</span>
          </div>
          <a href="https://www.extra.ec/noticia/economia/empresas-esperan-instrucciones-gobierno-anuncio-suspender-desconexiones-noviembre-165681.html" style="font-family:Georgia, 'Times New Roman', serif; font-size:18px; line-height:24px; font-weight:bold; color:#0b3d66; text-decoration:none;">Ecuador anuncia el fin de las desconexiones eléctricas a empresas desde el 1 de noviembre</a>
          <div style="font-size:12px; line-height:18px; color:#6b7b8b; padding-top:4px;">Diario Extra · 22 oct 2026 · Ecuador</div>
          <p style="margin:10px 0 0 0; font-size:15px; line-height:23px; color:#2b3a49;">El secretario de la Administración Pública, José Julio Neira, anunció que desde el 1 de noviembre las empresas de alto consumo eléctrico (categorías AV1 y AV2) dejarían de sufrir desconexiones. Desde el 22 de septiembre, por la sequía que redujo la generación hidroeléctrica, enfrentaban cortes de hasta 72 horas semanales. Los gremios, entre ellos la Cámara Nacional de Acuacultura, aún esperan una resolución oficial y advierten sobre el impacto en la producción, las exportaciones y el empleo.</p>
          <p style="margin:8px 0 0 0; font-size:14px; line-height:21px; color:#2b3a49;"><strong style="color:#1a7a6a;">Por qué importa:</strong> Los cortes golpearon la producción industrial y exportadora; normalizar el suministro es crítico para la competitividad de la industria ecuatoriana.</p>
          <p style="margin:10px 0 0 0; font-size:14px; line-height:20px;"><a href="https://www.extra.ec/noticia/economia/empresas-esperan-instrucciones-gobierno-anuncio-suspender-desconexiones-noviembre-165681.html" style="color:#0a5c99; font-weight:bold; text-decoration:underline;">Leer la noticia completa en Diario Extra &rarr;</a></p>
        </td></tr>
      </table>
    </td>
  </tr>

  <!-- CATEGORÍA: INDUSTRIA VERDE -->
  <tr>
    <td class="px" style="padding:24px 32px 0 32px; font-family:Arial, Helvetica, sans-serif;">
      <div style="font-size:12px; line-height:16px; font-weight:bold; letter-spacing:1.2px; text-transform:uppercase; color:#0b3d66; border-bottom:2px solid #0b3d66; padding-bottom:6px;">Industria verde y economía circular</div>

      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="border-bottom:1px solid #e1e7ed;">
        <tr><td style="padding:16px 0;">
          <div style="font-size:11px; line-height:16px; padding-bottom:6px;">
            <span style="color:#1a7a6a; font-weight:bold;">Inspiración</span>
          </div>
          <a href="https://www.bioeconomia.info/2026/10/22/bioeconomia-economia-circular-america-latina-cepal-clusteres/" style="font-family:Georgia, 'Times New Roman', serif; font-size:18px; line-height:24px; font-weight:bold; color:#0b3d66; text-decoration:none;">CEPAL y la cooperación alemana impulsan clústeres de bioeconomía y economía circular, con dos casos colombianos</a>
          <div style="font-size:12px; line-height:18px; color:#6b7b8b; padding-top:4px;">BioEconomía.info · 22 oct 2026 · Colombia y regional</div>
          <p style="margin:10px 0 0 0; font-size:15px; line-height:23px; color:#2b3a49;">Un programa de la CEPAL con la cooperación alemana (BMZ y GIZ) acompañó durante seis meses a 10 iniciativas de clúster de seis países, elegidas entre 94 postulaciones, para integrar la bioeconomía y la economía circular. Entre ellas, el Clúster Cárnico Bovino de Antioquia propone biofábricas que conviertan residuos ganaderos en energía y biofertilizantes para unos 600 ganaderos. En el seminario de cierre, la CEPAL y la CAF señalaron el financiamiento como el principal cuello de botella.</p>
          <p style="margin:8px 0 0 0; font-size:14px; line-height:21px; color:#2b3a49;"><strong style="color:#1a7a6a;">Por qué importa:</strong> Es un modelo replicable de economía circular en cadenas agroindustriales andinas y un posible espacio de colaboración con la CEPAL y la cooperación alemana.</p>
          <p style="margin:10px 0 0 0; font-size:14px; line-height:20px;"><a href="https://www.bioeconomia.info/2026/10/22/bioeconomia-economia-circular-america-latina-cepal-clusteres/" style="color:#0a5c99; font-weight:bold; text-decoration:underline;">Leer la noticia completa en BioEconomía.info &rarr;</a></p>
        </td></tr>
      </table>
    </td>
  </tr>

  <!-- PARA SEGUIR DE CERCA -->
  <tr>
    <td class="px" style="padding:26px 32px 4px 32px;">
      <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#f4f7fa; border-left:4px solid #1a8a7a;">
        <tr><td style="padding:16px 20px; font-family:Arial, Helvetica, sans-serif;">
          <div style="font-size:15px; line-height:21px; font-weight:bold; color:#0b3d66;">Para seguir de cerca</div>
          <div style="font-size:14px; line-height:21px; color:#2b3a49; padding-top:6px;">Brasil elige presidente el 25 de octubre en una segunda vuelta muy reñida entre Lula y Flávio Bolsonaro. El resultado marcará el rumbo de la política industrial brasileña y de la relación con China, con efectos sobre el comercio y la inversión en toda la región. <a href="https://chinaglobalsouth.com/2026/10/17/china-brazil-presidential-election-bolsonaro-lula-2026/" style="color:#0a5c99; font-weight:bold;">Análisis en The China-Global South Project (en inglés) &rarr;</a></div>
        </td></tr>
      </table>
    </td>
  </tr>

  <!-- NOTA DE MÉTODO -->
  <tr>
    <td class="px" style="padding:22px 32px 26px 32px; font-family:Arial, Helvetica, sans-serif; font-size:11px; line-height:17px; color:#6b7b8b;">
      Selección del equipo a partir de 18 noticias identificadas mediante búsqueda asistida por IA en medios, anuncios oficiales y empresariales, organismos multilaterales e investigación (español, inglés y portugués). Títulos traducidos al español cuando la fuente está en otro idioma.
    </td>
  </tr>

  <!-- PIE -->
  <tr>
    <td class="px" style="background-color:#0b3d66; padding:18px 32px; font-family:Arial, Helvetica, sans-serif; font-size:12px; line-height:18px; color:#cfe2f3;">
      Radar Regional — Oficina Andina de ONUDI (Colombia, Perú, Bolivia, Ecuador)<br>
      ¿Tiene una noticia para el próximo número? Responda a este correo.<br>
      <span style="color:#9cc7ea;">Las noticias de terceros se enlazan con su fuente y no reflejan necesariamente la posición de ONUDI.</span>
    </td>
  </tr>

</table>

</td></tr>
</table>
</body>
</html>
$q$,8,0);
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,1,false,$q$Perú y Ecuador firman acuerdos en energía, pesca y desarrollo fronterizo; Perú asume la presidencia de la CAN$q$,$q$En el XVII Gabinete Binacional, celebrado en Lima el 20 de octubre, Noboa y Fujimori adoptaron el Plan de Acción de Lima. Petroecuador y Petroperú firmaron un memorando de cooperación en hidrocarburos y ambos países acordaron combatir la pesca ilegal. Perú recibió la presidencia pro tempore de la CAN 2026-2027.$q$,$q$Define la agenda de integración andina del próximo año y abre espacio a proyectos binacionales de energía e industria.$q$,$q$https://www.eluniverso.com/politica/ejecutivo/ecuador-y-peru-firman-acuerdos-de-cooperacion-en-seguridad-energia-y-desarrollo-fronterizo-nota/$q$,$q$El Universo$q$,$q$Perú, Ecuador$q$,$q$Inversión, comercio e integración$q$,$q$Oportunidad$q$,true,true,11,5,$q$2026-10-20$q$ from public.ediciones where slug=$q$semanal-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,2,false,$q$Índice Latinoamericano de IA 2026: Colombia 4.ª, Perú 7.º, Ecuador 9.º y Bolivia 18.ª$q$,$q$La CEPAL y el CENIA presentaron el ILIA 2026, que evalúa a 20 países. Colombia obtiene 56,8 puntos, Perú 52,7, Ecuador 51,8 y Bolivia 26,4. Usa IA el 27,6 % de las grandes empresas y solo el 6,8 % de las pequeñas.$q$,$q$Ofrece una línea de base comparable para medir la brecha digital de la industria y las pymes andinas.$q$,$q$https://www.bloomberglinea.com/tecnologia/los-paises-de-america-latina-mas-preparados-para-la-inteligencia-artificial-segun-ranking-de-cepal/$q$,$q$Bloomberg Línea$q$,$q$Regional$q$,$q$Innovación, digitalización y MiPymes$q$,$q$Benchmarking$q$,true,true,10,5,$q$2026-10-22$q$ from public.ediciones where slug=$q$semanal-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,3,false,$q$Perú lanza un paquete de S/ 18.000 millones frente a El Niño, con alivio tributario y liquidez para empresas$q$,$q$El MEF anunció S/ 18.000 millones adicionales para 2027, con bonos para familias vulnerables, aplazamiento de obligaciones tributarias, liberación de detracciones y préstamos para empresas afectadas.$q$,$q$Impacta a las mypes y cadenas productivas del norte y del sur andino.$q$,$q$https://rpp.pe/economia/economia/mef-anuncia-s-2500-millones-en-bonos-para-familias-vulnerables-ante-el-fenomeno-el-nino-quienes-los-recibiran-noticia-1713896$q$,$q$RPP$q$,$q$Perú$q$,$q$Política industrial y coyuntura$q$,$q$Contexto$q$,true,false,8,4,$q$2026-10-22$q$ from public.ediciones where slug=$q$semanal-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,4,false,$q$El puerto de Chancay podría superar los 422.000 TEU en 2026, un 82,5 % más que en 2025$q$,$q$Según la Cámara de Comercio de Lima, Chancay movió 246.452 TEU entre enero y julio, más que en todo 2025, y su participación en el tráfico nacional de contenedores pasó del 5,6 % al 10,1 %.$q$,$q$Reconfigura las rutas logísticas del Pacífico sudamericano y abre opciones de exportación a la región andina.$q$,$q$https://forbes.pe/economia-y-finanzas/2026-10-19/puerto-de-chancay-apunta-a-movilizar-mas-de-422-000-contenedores-en-2026-proyecta-la-ccl$q$,$q$Forbes Perú$q$,$q$Perú$q$,$q$Megaproyectos e infraestructura$q$,$q$Oportunidad$q$,true,true,6,5,$q$2026-10-19$q$ from public.ediciones where slug=$q$semanal-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,5,false,$q$Chile prevé licitar unos cinco nuevos proyectos de litio para más que duplicar su producción$q$,$q$El ministro Daniel Mas dijo que Chile licitará unos cinco proyectos de litio, además de otros cinco operados por privados, para pasar de unas 300.000 a 700.000 toneladas en cinco a diez años.$q$,$q$Referencia directa para la estrategia del litio de Bolivia.$q$,$q$https://es.marketscreener.com/noticias/chile-buscar-impulsar-nuevos-proyectos-de-litio-para-m-s-que-duplicar-producci-n-ministro-ce785cd9d88af722$q$,$q$Reuters (MarketScreener)$q$,$q$Chile$q$,$q$Energía y minerales críticos$q$,$q$Benchmarking$q$,true,false,6,4,$q$2026-10-21$q$ from public.ediciones where slug=$q$semanal-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,6,false,$q$La industria manufacturera colombiana cae 3,7 % en agosto y la ANDI pide reactivar sectores estratégicos$q$,$q$Según el DANE, la producción manufacturera bajó 3,7 % y las ventas 3,5 % en agosto; 29 de 39 subsectores retrocedieron. La ANDI pidió recuperar la confianza y reactivar sectores estratégicos.$q$,$q$Termómetro de la industria colombiana y de los subsectores que necesitan apoyo.$q$,$q$https://www.semana.com/economia/articulo/caida-en-produccion-manufacturera-preocupa-al-gremio-empresarial/202639/$q$,$q$Semana$q$,$q$Colombia$q$,$q$Política industrial y coyuntura$q$,$q$Contexto$q$,false,true,5,5,$q$2026-10-16$q$ from public.ediciones where slug=$q$semanal-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,7,false,$q$Ecuador anuncia el fin de las desconexiones eléctricas a empresas desde el 1 de noviembre$q$,$q$El Gobierno anunció que las empresas de alto consumo dejarían de desconectarse desde el 1 de noviembre, tras cortes de hasta 72 horas semanales por la sequía. Los gremios esperan una resolución oficial.$q$,$q$Normalizar el suministro es crítico para la industria ecuatoriana.$q$,$q$https://www.extra.ec/noticia/economia/empresas-esperan-instrucciones-gobierno-anuncio-suspender-desconexiones-noviembre-165681.html$q$,$q$Diario Extra$q$,$q$Ecuador$q$,$q$Energía y minerales críticos$q$,$q$Contexto$q$,false,true,3,5,$q$2026-10-22$q$ from public.ediciones where slug=$q$semanal-2026-10-23$q$;
insert into public.noticias (edicion_id,posicion,destacada,titular,resumen,por_que_importa,url,fuente,pais,categoria,proposito,mas_difundida,mas_relevante,difusion,relevancia,fecha_publicacion) select id,8,false,$q$CEPAL y la cooperación alemana impulsan clústeres de bioeconomía y economía circular, con dos casos colombianos$q$,$q$Un programa de la CEPAL con BMZ y GIZ acompañó a 10 iniciativas de clúster de seis países; el Clúster Cárnico de Antioquia propone biofábricas que conviertan residuos ganaderos en energía y biofertilizantes.$q$,$q$Modelo replicable de economía circular en cadenas agroindustriales andinas.$q$,$q$https://www.bioeconomia.info/2026/10/22/bioeconomia-economia-circular-america-latina-cepal-clusteres/$q$,$q$BioEconomía.info$q$,$q$Colombia, regional$q$,$q$Industria verde y economía circular$q$,$q$Inspiración$q$,false,false,1,5,$q$2026-10-22$q$ from public.ediciones where slug=$q$semanal-2026-10-23$q$;
commit;
select e.slug, e.n_noticias, (select count(*) from public.noticias n where n.edicion_id=e.id) as noticias_cargadas, (select count(*) from public.investigaciones i where i.edicion_id=e.id) as investigaciones_cargadas from public.ediciones e order by e.slug;
