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

==-
