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

  # Enterprise GIS

  # Powered by QGIS

  <big>**Manage your organisation's geospatial data with QGIS**</big>

  <big>Ultimate control for your corporate GIS - publish spatial and non-spatial datasets, style layers, create data joins, apply geo-processing, and more.</big>

:::

--![](/static/img/screenshots/qgis-to-pozi.png)--

:::centre

<big>**Design in QGIS. Publish in Pozi.**</big>

<big>QGIS is the ultimate toolkit for publishing location-based information to users across your organisation</big>

:::

</br>

## Ultimate control

Use QGIS to easily manage and publish map layers to your users.

Easily apply styling, customise fields, join datasets, and more, all within the familiar QGIS open source desktop application.

* maintain control over map layers available to staff
* quickly respond to staff requirements
* build your organisation's in-house capabilities for maintaining GIS configuration
* make it easier for users to discover and access specialised datasets they need

--![Pozi displays a flood model map rendered by QGIS from a CSV file containing spot height values](/static/img/screenshots/swan-hill-flood-model-map-from-csv.png)--

Functionality for Administrators:

* manage spatial and non-spatial datasets
* organise map layers in groups and nested folders
* control layer styling, filtering, thematic maps
* expose/hide data fields, and use field name aliases
* create virtual fields with calculations and text expressions
* create dynamic table joins to link non-spatial data to map layers

</br>

## Enterprise performance from QGIS Server

<img src="/static/img/qgis-logo.png " alt="" style="float:right;width:120px;margin:0px 40px;">

Pozi's QGIS integration is powered by [QGIS Server](https://docs.qgis.org/3.22/en/docs/server_manual/introduction.html). QGIS Server is a standards-based WMS/WFS server, with the same high performance as MapServer and GeoServer, with the bonus of using QGIS's powerful configuration tools for managing your users' Pozi experience.

Configure your layers in dedicated QGIS projects; the layers are immediately available for internal Pozi users.

QGIS Server is [certified by the OGC](https://www.opengeospatial.org/resource/products/details/?pid=1496) as an [OGC reference implementation](https://blog.qgis.org/2018/06/27/qgis-server-certified-as-official-ogc-reference-implementation/).

</br>

## How it works

### Architecture and Security

QGIS Server is installed on your network (physical or private cloud) as part of the Pozi Server implementation.

Pozi's *hybrid cloud* architecture enables any user to access the Pozi web application and **public** datasets from wherever they are. However internal datasets that you publish with QGIS are available only to those users who are on your organisation's corporate network.

![](/static/draw.io/network-diagram-enterprise.png)

Users within your organisation's network have access to the layers you publish with QGIS Server.

Any users outside of your network will still have access to the public datasets that are configured for your site, but they will not have access to internal datasets.

### Configuration

<img src="/admin-guide/qgis/img/qgis-projects-and-pozi-layer-groups.png" alt="" style="float:right;width:400px;margin:0px 40px;">

Add and configure your layers in dedicated QGIS projects to make them available in Pozi.

Each QGIS project represents a *layer group* in Pozi.

Layer groups can contain nested folders of layers, just as you've configured in QGIS.

<br clear="all" />

## Advanced Functionality

### Styling

Control the appearance of your map layers using QGIS's advanced styling interface.

Display your data using thematic/categorised colours and/or symbols, with fine-tune control over the layer appearance. Even customise your layer legend.

### Joining

Dynamically join spatial and non-spatial data sources to create combined layers.

For instance, you can maintain your asset location data in a shapefile or spatial database while letting your asset management system take care of all asset attributes and history.

By using dynamic joins, you don't need to duplicate attributes from one source to another, and you don't need scheduled tasks to join them.

QGIS will dynamically join your datasets, and users will see a seamless combination of authoritative spatial and non-spatial information in a single layer.

</br>

## Ready to learn more?

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
