---
title: WMS Catalogue
---

# WMS (Web Map Service) Catalogue

==- Example Config

```json
{
  "title": "Elevation",
  "group": "Elevation",
  "type": "WMSGetCapabilities",
  "config": {
    "spatial": {
      "url": "https://bs-gis.pozi.com/iis/qgisserver?service=WMS&REQUEST=GetCapabilities&MAP=//bs-intra/GIS/System/POZI/QGIS Projects/Elevation.qgs"
    }
  },
  "localDataSource": true
}
```

==-

## Configuration

### Enable Selectability

There is currently a limitation in Pozi that prevents users from seeing any attributes when they click on features in WMS layers. The way around this is to configure the dataset with `"parent": "Whats Here"`. This forces Pozi to display the attributes in the info panel when the layer is turned on .

There is [a plan](https://trello.com/c/NuPIDgSL/18-enable-wms-layers-getfeatureinfo-results-to-be-displayed-in-info-panel-by-default) to avoid the need for this work-around in the future.

```json
  "parent": "Whats Here"
```

==- Example Config

  ```json
  {
    "title": "Assets",
    "group": "Assets",
    "parent": "Whats Here",
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
