---
title: Layer Styling
sidebar_position: 4
---

:::note Under Construction

*This page is a work in progress. Please refer to our existing Help Guide for information about this topic.*

[Existing Help Guide](https://help.pozi.com/search?query=layer+styling)

:::

---

## Styled Layer Descriptor (SLD)

### Generating SLDs

1. open your source dataset in QGIS
2. style the layer using the QGIS styling controls
3. export the style to an SLD file
4. place SLD file in public sync folder, along with the corresponding GeoJSON file

![Creating SLD in QGIS](./img/creating-sld-in-qgis.gif)

### Styling Options

Supported:

* simple points, lines, polygons symbolisers
  * `square`
  * `circle`
  * `triangle`
  * `star`
  * `cross`
  * `x`
* rule-based styles
* basic labels
* customisable legend text

Not currently supported:

* fill hatching
* label offsets
* rules based on a field name that contains spaces

Tips

* opacity must be defined in the colour - the layer's global opacity slider has no effect
* for polygon features to be selectable, the fill opacity must be greater than `0` - it can be as little as 1%

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
