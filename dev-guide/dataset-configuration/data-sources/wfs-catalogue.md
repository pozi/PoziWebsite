---
title: WFS Catalogue
---

# WFS (Web Feature Service) Catalogue

!!!note

When specifying the URL for QGS project files, any backslashes must be converted to forward slashes.

!!!

==- Example Configuration

  ```json
  {
    "title": "Assets",
    "group": "Assets",
    "type": "WFSGetCapabilities",
    "serverType": "qgis",
    "config": {
      "spatial": {
        "url": "https://hrccsvrgis01.pozi.com/iis/qgisserver?service=WFS&request=GetCapabilities&MAP=//ad.hrcc.vic.gov.au/shared/GIS/workspaces/Pozi/Assets.qgs",
        "id": "$id"
      }
    },
    "styleGeoStyler": {
      "url": "https://hrccsvrgis01.pozi.com/iis/qgisserver?service=WMS&VERSION=1.3.0&request=GetStyles&MAP=//ad.hrcc.vic.gov.au/shared/GIS/workspaces/Pozi/Assets.qgs",
      "type": "SLD"
    },
    "localDataSource": true
  }
  ```

  Note the style URL has two critical differences from the data URL:
  
  * `service=WMS` (not WFS)
  * `request=GetStyles` (not GetCapabilities)

==-

## Configuration

### Parameters

#### Restrict results to bounding box

```json
"params": {
  "BBOX": "-38.27,144.66,-38.24,144.71"
}
```

==- Example

```json
{
  "title": "Vicmap Features of Interest",
  "group": "Features of Interest",
  "type": "WFSGetCapabilities",
  "config": {
    "spatial": {
      "url": "https://data.pozi.com/datavic/datavic_wfs_getcapabilities_vmfeat.xml",
      "params": {
        "BBOX": "-38.27,144.66,-38.24,144.71"
      }
    }
  }
}
```

#### OGC Filter

WFS requests utilise OGC filters that can be applied to target specific records.

* Example: `FILTER=<Filter><PropertyIsEqualTo><PropertyName>AssetID</PropertyName><Literal>12345</Literal></PropertyIsEqualTo></Filter>`
* Reference: http://schemas.opengis.net/filter/2.0/filter.xsd

==-

## Custom Catalogues

### data.gov.au

#### Southern Grampians Land Capability

1. go to https://jsonformatter.org/xml-pretty-print
2. Load Data > Load URL > `https://data.gov.au/geoserver/wfs?request=GetCapabilities`
3. Download > save as `datagovau-wfs.xml`
4. save copy as `datagovau-wfs-southerngrampians-landcapability.xml`
5. modify `datagovau-wms-southerngrampians-landcapability.xml`
  - search for first instance of `southern-grampians-model`
  - delete all `<FeatureType>` elements that appear beforehand
  - search for last instance of `southern-grampians-model`
  - delete all `<FeatureType>` elements that appear afterwards
  - find and replace `Southern Grampians Model of ` with `[blank]`
6. save
7. upload in Pozi Config Manager

==- Configuration

```json
{
  "title": "Land Capability WFS Catalogue",
  "group": "Land Capability",
  "type": "WFSGetCapabilities",
  "config": {
    "spatial": {
      "url": "https://config.pozi.com/public/files/datagovau-wfs-southerngrampians-landcapability.xml"
    }
  },
  "styleGeoStyler": {
    "type": "SLD",
    "url": "https://config.pozi.com/public/files/datagovau-wfs-southerngrampians-landcapability.sld?"
  },
  "opacity": 0.5
}
```

This configuration is designed to apply the same style to every layer in the catalogue.

The `?` at the end of the style URL enables Pozi to add layer parameters as it normally does for style requests but have those parameters ignored by the server.

==-
