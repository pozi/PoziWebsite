---
title: WMS Catalogue
---

# WMS (Web Map Service) Catalogue

## Configuration

==- QGIS Server Example

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

==- DataVic Example

```json
{
  "title": "DataVic",
  "group": "DataVic",
  "type": "WMSGetCapabilities",
  "config": {
    "spatial": {
      "url": "https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wms?request=getCapabilities"
    }
  }
}
```

==-

## Custom Catalogues

### DataVic

The [DataVic WMS GetCapabilities](https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wms?request=getCapabilities) is a 1MB file containing over 600 layers. While it's possible for Pozi to consume this entire catalogue, it will slow down the app load, and the user would see all 600 layers in a single layer group.

To provide a faster and more useful user experience, the catalogue is customised to remove unwanted layers and split it into separate catalogues to be shown in separate layer groups.

These custom catalogue files can be hosted as static files.

#### Vicmap Admin

1. download [DataVic WMS GetCapabilities](https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wms?request=getCapabilities) and save as `datavic-wms.xml`
2. save copy as `datavic-wms-vmadmin.xml`
3. modify `datavic-wms-vmadmin.xml`
  - search for first instance of `vmadmin`
  - delete all `<layer>` elements that appear beforehand
  - search for last instance of `vmadmin`
  - delete all `<layer>` elements that appear afterwards
  - find and replace ` - Vicmap Admin` with `[blank]`
  - find and replace ` (polygon)` with `[blank]`
  - find and replace `WARD ` with `Ward `
4. save
5. upload in Pozi Config Manager

==- DataVic Example

```json
{
  "title": "Administrative Catalogue",
  "group": "Administrative",
  "type": "WMSGetCapabilities",
  "config": {
    "spatial": {
      "url": "https://config.pozi.com/public/files/datavic-wms-vmadmin.xml"
    }
  }
}
```

==-

### data.gov.au

#### Southern Grampians Land Capability

1. download [data.gov.au WMS GetCapabilities](https://data.gov.au/geoserver/wms?request=GetCapabilities) and save as `datagovau-wms.xml`
2. save copy as `datagovau-wms-southerngrampians-landcapability.xml`
3. modify `datagovau-wms-southerngrampians-landcapability.xml`
  - search for first instance of `southern-grampians-model`
  - delete all `<layer>` elements that appear beforehand
  - search for last instance of `southern-grampians-model`
  - delete all `<layer>` elements that appear afterwards
  - find and replace `Southern Grampians ` with `[blank]`
  - remove all `CRS` items, except:
```
      <CRS>EPSG:3857</CRS>
      <CRS>EPSG:4326</CRS>
      <CRS>CRS:84</CRS>
```

4. save
5. upload in Pozi Config Manager

==- Configuration

```json
{
  "title": "Land Capability Catalogue",
  "group": "Land Capability",
  "type": "WMSGetCapabilities",
  "config": {
    "spatial": {
      "url": "https://config.pozi.com/public/files/datagovau-wms-southerngrampians-landcapability.xml",
      "label": "class_desc"
    }
  }
}
```

==-
