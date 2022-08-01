---
title: QGIS Catalogue
---

# QGIS Catalogue

## Configuration

==- Example Catalogue Config

```json
{
  "title": "Assets Catalogue",
  "group": "Assets",
  "type": "QGISProjectSettings",
  "localDataSource": true,
  "config": {
    "spatial": {
      "url": "https://bs-gis.pozi.com/iis/qgisserver?service=WMS&REQUEST=GetProjectSettings&MAP=//bs-intra/GIS/System/POZI/QGIS Projects/Assets.qgs"
    }
  },
  "styleGeoStyler": {
    "url": "https://bs-gis.pozi.com/iis/qgisserver?service=WMS&request=GetStyles&MAP=//bs-intra/GIS/System/POZI/QGIS Projects/Assets.qgs",
    "type": "SLD"
  }
}
```

==- Example Aerial Imagery Catalogue

```json
{
  "title": "Aerials Catalogue",
  "group": "Aerials",
  "type": "WMSGetCapabilities",
  "localDataSource": true,
  "config": {
    "spatial": {
      "url": "https://bs-gis.pozi.com/iis/qgisserver?service=WMS&REQUEST=GetCapabilities&MAP=//bs-intra/GIS/System/POZI/QGIS Projects/Aerials.qgs"
    }
  },
  "linkedLayers": [
    "Vicmap Labels"
  ]
}
```

==-
