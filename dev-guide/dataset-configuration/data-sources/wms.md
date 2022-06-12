---
title: WMS (Web Map Service)
sidebar_label: WMS
---

## Services

### DELWP DataVic

This service is soon to be retired. See 'DELWP DataVic (New)' below for details about the replacement service.

* [GetCapabilities](https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wms?request=getCapabilities)

### DELWP DataVic (New)

* [GetCapabilities](https://geoserver-uat.maps.vic.gov.au/geoserver/ows?service=WMS&request=getCapabilities)
* [GeoWebCache](https://geoserver-uat.maps.vic.gov.au/geoserver/gwc/)

### data.gov.au

* [GeoServer Layer Preview](https://data.gov.au/geoserver/web/wicket/bookmarkable/org.geoserver.web.demo.MapPreviewPage?0)
* [GetCapabilities](https://data.gov.au/geoserver/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities)

### Pozi Cloud Server

* [Example GetCapabilities](https://d2nozjvesbm579.cloudfront.net/iis/qgisserver?service=WMS&request=GetCapabilities&MAP=C:/Program%20Files%20(x86)/Pozi/server/data/local/sample/queenscliffe/vicmap.qgs)

## Layer Type

For WMS datasets, the dataset type can be either `TileWMS` or `ImageWMS`.

* `TileWMS` - loads the layer in a series of 640 x 640 image tiles. The tiles load incrementally in the map view, enabling the user to start to see the layer before the the entire map view is generated.
* `ImageWMS` - loads the layer as a single image that covers the current map view. In most scenarios it will be slower to load, but may be useful in avoiding unwanted duplication of any label text. (Note: there are currently differences between the way that Pozi loads TileWMS and ImageWMS layers that might result in degraded functionality for ImageWMS)

```json
  "type": "TileWMS"
```

## Layer and Styling Configuration

==- Layer with default style

```json
{
  "title": "Public Land",
  "legend": "https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wms?request=GetLegendGraphic&version=1.0.0&format=image/gif&width=20&height=20&layer=CROWNLAND_PLM25",
  "group": "Administrative",
  "type": "TileWMS",
  "config": {
    "url": "https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wms",
    "params": {
      "LAYERS": "CROWNLAND_PLM25",
      "FORMAT": "image/GIF"
    }
  },
  "opacity": 0.5
}
```

==-

### External SLD

WMS GetMap requests can be made with an `sld` parameter that contains the URL of an SLD file.

*Note: as at 25 Feb 2022, the data.gov.au WMS service is not successfully responding to WMS requests that point to external SLDs. See 'Embedded SLD' below for an alternative styling configuration. Or better yet, consider using WFS if the dataset is small enough.*

==- Layer with external SLD

  *Note: the layer name is not specified in the config because it is specified within the SLD itself.*

  ```json
  {
    "title": "Localities",
    "group": "Administrative",
    "type": "TileWMS",
    "config": {
      "url": "https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wms",
      "params": {
        "SLD": "http://files.pozi.com/config/sld/datavic-VMADMIN_LOCALITY_POLYGON-BENDIGO.sld",
        "FORMAT": "image/png8"
      }
    }
  }
  ```

==-

### Embedded SLD

WMS GetMap requests can be made with an `sld_body` parameter that contains the SLD styling rules as a string of XML.

==- Layer with embedded SLD

  ```json
  {
    "title": "Park and Street Trees",
    "group": "Council Facilities and Services",
    "type": "TileWMS",
    "config": {
      "url": "https://data.gov.au/geoserver/wms",
      "params": {
        "sld_body": "<?xml version='1.0' encoding='UTF-8'?><StyledLayerDescriptor xmlns='http://www.opengis.net/sld' xmlns:ogc='http://www.opengis.net/ogc' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' version='1.1.0' xmlns:xlink='http://www.w3.org/1999/xlink' units='mm' xsi:schemaLocation='http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd' xmlns:se='http://www.opengis.net/se'><NamedLayer><se:Name>ckan_ed15e3ea_48dc_47d2_afa6_518e6f5276e1</se:Name><UserStyle><se:Name>Glen Eira - Trees</se:Name><se:FeatureTypeStyle><se:Rule><se:Name>Single symbol</se:Name><se:PointSymbolizer><se:Graphic><se:Mark><se:WellKnownName>circle</se:WellKnownName><se:Fill><se:SvgParameter name='fill'>#33a02c</se:SvgParameter></se:Fill><se:Stroke><se:SvgParameter name='stroke'>#000000</se:SvgParameter></se:Stroke></se:Mark><se:Size>10</se:Size></se:Graphic></se:PointSymbolizer></se:Rule></se:FeatureTypeStyle></UserStyle></NamedLayer></StyledLayerDescriptor>"
      }
    }
  }
  ```

==-

#### Switching from external SLD to embedded SLD:

1. download the existing external SLD and open in text editor (VSCode or NotePad++ recommended)
2. find and replace double quotes with single quotes
3. find and replace double spaces with blank
4. find and replace line returns with blank

The resulting text is a single line of XML.

In the dataset config, replace the existing `sld` parameter with a new `sld_body` parameter, using the line of XML as the value.

Example configurations:

* [Glen Eira Street Trees](https://github.com/pozi/PoziAppConfig/commit/c2f9bf6b3eb9998b27d85df266ebf48fc4ff80c5#diff-5a45ada4e9f3d1ed3db20f652cabe746c1767390718cf94228bc25a7576c9f7dL776-R776)
* [Mitchell Contours](https://github.com/pozi/PoziAppConfig/commit/d95812fd4691e86e0fac3de91d0e3ad5fbb7683b#diff-216128510370c47687518818e49f4d63083c96ba0b3686031cea3cc7dc0d98feL3214-R3234)

### CQL Filter

==- Layer with CQL Filter

```json
{
  "title": "Public Land - Council Committee of Management",
  "group": "Administrative",
  "type": "TileWMS",
  "config": {
    "url": "https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wms",
    "params": {
      "LAYERS": "CROWNLAND_PLM25",
      "FORMAT": "image/GIF",
      "CQL_FILTER": "MNG_GROUP='COM Council'"
    }
  }
}
```

==-
