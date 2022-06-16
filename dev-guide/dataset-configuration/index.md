---
order: 90
---

# Dataset Configuration

## Schema

See https://github.com/pozi/PoziApp/blob/master/app/src/ConfigManager/schemas/layer-schema.json

## Dataset Types

```
GeoJSON
Image
ImageWMS
QGISGetProjectSettings
Search
TileWMS
TileWMSAuth
Mapbox
Mapbox-GL
Mapbox-OLSM
VectorTile
Vicmap
WFSGetCapabilities
WMSGetCapabilities
XYZ
```


#### Link-Out

##### Web Application

```json
  "externalLinks": [
    {
      "url": "http://communityhub.loddon.vic.gov.au/public/processExternalAction.aspx?element=assessmentid&source=pozi&id=[identifiers]",
      "label": "Send to Open Office",
      "propertyName": "Property Number",
      "localDataSource": true
    }
  ],
```

##### Windows Application via URL Protocol

```json
  "externalLinks": [
    {
      "url": "gclaunch://action=PropertyGov&open=true&fid=[identifiers]&rnd=1611116478",
      "label": "Open in Property.Gov",
      "propertyName": "Property Number",
      "localDataSource": true
    }
  ],
```
