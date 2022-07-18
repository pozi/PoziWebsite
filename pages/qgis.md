---
title: QGIS
route: /qgis
layout: central
---

#

<style>
    .centre {
        text-align: center;
        width: 100%;
        padding: 40px;
        padding-bottom: 10px;
</style>

<!--- START HEADING --->

:::centre

  # Powered by QGIS

  <big>Use QGIS to publish your layers across your organisation.</big>
  
  QGIS provides ultimate control for adding data sources, layer styling, filtering, data joins, metadata, and more.

:::

--![](/static/img/tweet-gallery/northern_grampians_waste_route_styling.png)--

:::centre

<big>QGIS is ultimate toolkit for publishing location-based information to users within your organisation</big>

:::

## Ultimate control

Use QGIS to easily manage and publish map layers across your organisation.

Simply add layers to a QGIS project to make them available in Pozi. Easily apply styling, customise fields, join datasets, add metadata, and more, all within the familiar QGIS open source desktop application.

Benefits:

* maintain control over map layers available to staff
* quickly respond to staff requirements
* build your organisation's in-house capabilities for maintaining GIS configuration
* make it easier for users to discover and access specialised datasets that are useful to their workflows

Functionality for Administrators:

* add/remove map layers
* organise layers in nested groups
* control styling, filtering, thematic maps
* expose/hide data fields, and rename fields
* create dynamic table joins
* update metadata

### Styling

### Filtering

### Joining

### Publishing

## Enterprise performance from QGIS Server

Pozi's QGIS integration is powered by [QGIS Server](https://docs.qgis.org/3.22/en/docs/server_manual/introduction.html), which is installed on your network or private cloud. QGIS Server is a standards-based WMS/WFS server, with similar performance as MapServer and GeoServer, but with the ability to use QGIS desktop for layer configuration.

Configure your layers in dedicated QGIS project files, and the layers are automatically made available for internal Pozi users.

QGIS Server is [certified by the OGC](https://www.opengeospatial.org/resource/products/details/?pid=1496) as an [OGC reference implementation](https://blog.qgis.org/2018/06/27/qgis-server-certified-as-official-ogc-reference-implementation/).

---

:::centre

  <big>Get in touch to discover how to power your GIS with QGIS</big>

:::

<iframe
    id="JotFormIFrame-221511629414045"
    title="Website Contact Form"
    onload="window.parent.scrollTo(0,0)"
    allowtransparency="true"
    allowfullscreen="true"
    allow="geolocation; microphone; camera"
    src="https://form.jotform.com/221511629414045"
    frameborder="0"
    style="
    min-width: 100%;
    height:539px;
    border:none;"
    scrolling="no"
>
</iframe>
<script type="text/javascript">
  var ifr = document.getElementById("JotFormIFrame-221511629414045");
  if (ifr) {
    var src = ifr.src;
    var iframeParams = [];
    if (window.location.href && window.location.href.indexOf("?") > -1) {
      iframeParams = iframeParams.concat(window.location.href.substr(window.location.href.indexOf("?") + 1).split('&'));
    }
    if (src && src.indexOf("?") > -1) {
      iframeParams = iframeParams.concat(src.substr(src.indexOf("?") + 1).split("&"));
      src = src.substr(0, src.indexOf("?"))
    }
    iframeParams.push("isIframeEmbed=1");
    ifr.src = src + "?" + iframeParams.join('&');
  }
  window.handleIFrameMessage = function(e) {
    if (typeof e.data === 'object') { return; }
    var args = e.data.split(":");
    if (args.length > 2) { iframe = document.getElementById("JotFormIFrame-" + args[(args.length - 1)]); } else { iframe = document.getElementById("JotFormIFrame"); }
    if (!iframe) { return; }
    switch (args[0]) {
      case "scrollIntoView":
        iframe.scrollIntoView();
        break;
      case "setHeight":
        iframe.style.height = args[1] + "px";
        break;
      case "collapseErrorPage":
        if (iframe.clientHeight > window.innerHeight) {
          iframe.style.height = window.innerHeight + "px";
        }
        break;
      case "reloadPage":
        window.location.reload();
        break;
      case "loadScript":
        if( !window.isPermitted(e.origin, ['jotform.com', 'jotform.pro']) ) { break; }
        var src = args[1];
        if (args.length > 3) {
            src = args[1] + ':' + args[2];
        }
        var script = document.createElement('script');
        script.src = src;
        script.type = 'text/javascript';
        document.body.appendChild(script);
        break;
      case "exitFullscreen":
        if      (window.document.exitFullscreen)        window.document.exitFullscreen();
        else if (window.document.mozCancelFullScreen)   window.document.mozCancelFullScreen();
        else if (window.document.mozCancelFullscreen)   window.document.mozCancelFullScreen();
        else if (window.document.webkitExitFullscreen)  window.document.webkitExitFullscreen();
        else if (window.document.msExitFullscreen)      window.document.msExitFullscreen();
        break;
    }
    var isJotForm = (e.origin.indexOf("jotform") > -1) ? true : false;
    if(isJotForm && "contentWindow" in iframe && "postMessage" in iframe.contentWindow) {
      var urls = {"docurl":encodeURIComponent(document.URL),"referrer":encodeURIComponent(document.referrer)};
      iframe.contentWindow.postMessage(JSON.stringify({"type":"urls","value":urls}), "*");
    }
  };
  window.isPermitted = function(originUrl, whitelisted_domains) {
    var url = document.createElement('a');
    url.href = originUrl;
    var hostname = url.hostname;
    var result = false;
    if( typeof hostname !== 'undefined' ) {
      whitelisted_domains.forEach(function(element) {
          if( hostname.slice((-1 * element.length - 1)) === '.'.concat(element) ||  hostname === element ) {
              result = true;
          }
      });
      return result;
    }
  };
  if (window.addEventListener) {
    window.addEventListener("message", handleIFrameMessage, false);
  } else if (window.attachEvent) {
    window.attachEvent("onmessage", handleIFrameMessage);
  }
</script>
