---
title: QGIS Server
---

!!!note

When specifying the URL for QGS project files, any backslashes must be converted to forward slashes.

!!!

## WFS GetCapabilities

==- Example Configuration

  ```json
  {
    "title": "Assets",
    "group": "Assets",
    "type": "WFSGetCapabilities",
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

  Note that the GetStyles URL for SLDs is `service=WMS` (not WFS).

==-

## WMS GetCapabilities

==- Example Configuration

  ```json
  {
    "title": "Assets",
    "group": "Assets",
    "type": "WMSGetCapabilities",
    "config": {
      "spatial": {
        "url": "https://hrccsvrgis01.pozi.com/iis/qgisserver?service=WMS&request=GetCapabilities&MAP=//ad.hrcc.vic.gov.au/shared/GIS/workspaces/Pozi/Assets.qgs"
      }
    },
    "localDataSource": true
  }
  ```

==-

## GetProjectSettings

Coming soon.

https://docs.qgis.org/latest/en/docs/server_manual/services/wms.html#getprojectsettings

