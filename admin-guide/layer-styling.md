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

#### Exporting the SLD file

1. Layer Properties > Symbology > Style > Save Style
2. pick the SLD option
3. specify a file name and location
4. click OK

### Styling Options

Refer to our QGIS styling guide for vector layers:

[!ref icon="paintbrush" text="Styling layers"](./qgis/styling-layers.md)

Additional tips:

* opacity must be defined in the colour - the layer's global opacity slider has no effect when exporting to SLD
* for polygon features to be selectable, the fill opacity must be greater than `0` - it can be as little as 1%
* for rule-based styles, field names are case-sensitive (even though in QGIS they are case-insensitive)
* depending on the thickness of a line, the SLD file may need to be manually altered for dashed and dotted lines otherwise the gaps may disappear - eg. a 4 pixel thick line should be updated from `<se:SvgParameter name="stroke-dasharray">1 2</se:SvgParameter>` to `<se:SvgParameter name="stroke-dasharray">4 8</se:SvgParameter>`
* when styling layers served from a Geoserver instance, it may be necessary to prefix mark well known names with `shape://` in the SLD. eg. `<se:WellKnownName>shape://horline</se:WellKnownName>`.  For more details refer to Geoserver's documentation. [https://docs.geoserver.org/latest/en/user/styling/sld/extensions/pointsymbols.html#shape-symbols](https://docs.geoserver.org/latest/en/user/styling/sld/extensions/pointsymbols.html#shape-symbols).
* it isn't possible to style WMS layers in QGIS, however if the layer is also served using WFS, the WFS layer can be styled, and the exported SLD can also be used for the WMS layer
* if a layer (or legend) is not being styled correctly, it may be a result of the version of SLD.  Newer versions of QGIS export SLD v1.1.0.  As an example, the DEECA Geoserver WMS instance (https://opendata.maps.vic.gov.au/geoserver/wms), doesn't correctly portray SLD v1.1.0 legends, but this is fixed if the SLD is converted to v1.0.0.  GeoStyler (https://geostyler.github.io/geostyler-demo/) can be used to convert files between SLD versions.

==- Legacy Styling

### Symbols

Symbols can be chosen from any of the following:

* [https://thenounproject.com/](https://thenounproject.com/)
* [http://map-icons.com/](http://map-icons.com/)

Obtain the URL or icon name for the desired icon.

### Colours

Bubble symbols can be styled with any of the standard HTML colours listed at:<br/>
https://html-color-codes.info/color-names/.

==-
