---
order: 100
---

# Catalogues

Catalogues are collections of layers that are available from a single endpoint.

## Settings

### `layerFilter`

The `layerFilter` setting allows for managing what layers to show/hide. Only the layers that match the filter will be shown.

The matching is case-insensitive and allows for the use of wildcards for inclusion/exclusion, which makes it quite powerful.

**Example filter settings**:

* `"kindergartens, schools"`: only show the layers that are called `kindergartens` or `schools`
* `"kinder*, *zones, *bus*"`: show all layers that start with `kinder`, end with `zones` or have the word `bus` anywhere in the layer name
* `"!(child care centres | schools)"`: hide layers that are called `child care centres` or `schools`
* `"!(kinder* | *zones | *bus*)"`: hide all layers that start with `kinder`, end with `zones` or have the word `bus` anywhere in the layer name
* `"(*urban* | *commercial*), !(*boundary | *dem*)"`: show all layers that either have `urban` or `commercial` in their name but exclude any of these matching layers that end with `boundary` or have `dem` anywhere in the name

## Sources

### QGIS Server

#### Configuration

!!!note

When specifying the URL for QGIS project files, any backslashes must be converted to forward slashes.

!!!

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

  Note the critical difference between the two URLs:
  
  * Catalogue: `request=GetProjectSettings`
  * Styles: `request=GetStyles`

==- Example Aerial Imagery Catalogue

```json
{
  "title": "Aerials Catalogue",
  "group": "Aerials",
  "type": "WMSGetCapabilities",
  "localDataSource": true,
  "showLegend": false,
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

### WMS (Web Map Service)

#### Configuration

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

#### Single-Layer Catalogue

When you specify a reference to an individual layer in the GetCapabilities URL, you can effectively use the response as a single-layer catalogue.

Examples:

* https://data.gov.au/geoserver/southern-grampians-contours/wms?request=GetCapabilities
* https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/WATER_STORAGE/wms?request=getCapabilities

#### Custom Catalogues

##### DataVic

The [DataVic WMS GetCapabilities](https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wms?request=getCapabilities) is a 1MB file containing over 600 layers. While it's possible for Pozi to consume this entire catalogue, it will slow down the app load, and the user would see all 600 layers in a single layer group.

To provide a faster and more useful user experience, the catalogue is customised to remove unwanted layers and split it into separate catalogues to be shown in separate layer groups.

These custom catalogue files can be hosted as static files.

###### Vicmap Admin

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

### WFS (Web Feature Service)

#### Configuration

==- QGIS Server Example

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

##### Parameters

###### Restrict results to bounding box

```json
  "config": {
    "spatial": {
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

###### OGC Filter

WFS requests utilise OGC filters that can be applied to target specific records.

* Example: `FILTER=<Filter><PropertyIsEqualTo><PropertyName>AssetID</PropertyName><Literal>12345</Literal></PropertyIsEqualTo></Filter>`
* Reference: http://schemas.opengis.net/filter/2.0/filter.xsd

==-

#### Custom Catalogues

##### data.gov.au

###### Southern Grampians Land Capability

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

The `?` at the end of the style URL allows Pozi to add layer parameters (as it normally does for style requests) but have those parameters ignored by the server.

==-
