---
title: Layer Styling
sidebar_position: 4
icon: paintbrush
---

![](/static/img/tweet-gallery/northern_grampians_waste_route_styling.png){style="width:600px"}

## Styled Layer Descriptor (SLD)

### Generating SLDs

1. open your source dataset in QGIS
2. style the layer using the QGIS styling controls
3. export the style to an SLD file
4. include the SLD file with the GeoJSON file that you upload or sync

![Creating SLD in QGIS](./img/creating-sld-in-qgis.gif)

### Styling Options

Refer to our QGIS styling guide for vector layers:

[!ref](./qgis/configuring-layers/#styling-for-vector-layers)

Additional tips:

* opacity must be defined in the colour - the layer's global opacity slider has no effect
* for polygon features to be selectable, the fill opacity must be greater than `0` - it can be as little as 1%
* for rule-based styles, field names are case-sensitive (even though in QGIS they are case-insensitive)
* depending on the thickness of a line, the SLD file may need to be manually altered for dashed and dotted lines otherwise the gaps may disappear - eg. a 4 pixel thick line should be updated from `<se:SvgParameter name="stroke-dasharray">1 2</se:SvgParameter>` to `<se:SvgParameter name="stroke-dasharray">4 8</se:SvgParameter>`
* when styling layers served from a Geoserver instance, it may be necessary to prefix mark well known names with `shape://` in the sld. eg. `<se:WellKnownName>shape://horline</se:WellKnownName>` for more details refer to Geoserver's documentation. [https://docs.geoserver.org/latest/en/user/styling/sld/extensions/pointsymbols.html#shape-symbols](https://docs.geoserver.org/latest/en/user/styling/sld/extensions/pointsymbols.html#shape-symbols)

## Bubble Symbols

In addition to standard map styles, Pozi supports user-friendly "bubble" symbols.

Pick your symbol and colour, and email support@pozi.com to organise the setup on the style. The symbol can be referenced by URL or name, and the colour must be provided as a colour hex code (eg `#CD5C5C`).

### Symbols

Symbols can be chosen from any of the following:

* [https://thenounproject.com/](https://thenounproject.com/)
* [http://map-icons.com/](http://map-icons.com/)

Obtain the URL or icon name for the desired icon.
### Colours

Bubble symbols can be styled with any of the standard HTML colours listed at:<br/>
https://html-color-codes.info/color-names/.
