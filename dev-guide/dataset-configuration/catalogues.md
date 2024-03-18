---
order: 100
---

# Catalogues

Catalogues are collections of layers that are available from a single endpoint.

## Sources

### QGIS Server

QGIS Server can serve catalogues in the following types:

* `WMSGetCapabilities`
* `WFSGetCapabilities`
* `QGISProjectSettings` (includes WMS and WFS resources, and some custom settings)

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
  "showInLayerControl": true
}
```

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
      "url": "https://poziserver-queenscliffevicgovau.msappproxy.net/pozi/qgisserver/?service=WMS&REQUEST=GetProjectSettings&MAP=//boq-serv-2/GIS/QGIS/Pozi/Aerial.qgs",
      "params": {
        "format": "image/jpeg"
      },
      "tiled": true
    }
  },
  "flatten": true,
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

==- DataVic

```json
{
  "title": "DataVic",
  "group": "DataVic",
  "type": "WMSGetCapabilities",
  "config": {
    "spatial": {
      "url": "https://opendata.maps.vic.gov.au/geoserver/wms?request=GetCapabilities"
    }
  }
}
```

==-

##### Parameters

###### Use alternative `GetFeatureInfo` request parameters

By default, Pozi generates its `GetFeatureInfo` requests to use `info_format=application/json`.

However, if the endpoint is an ArcGIS server, it may respond with the following error: "Parameter 'InfoFormat' contains unacceptable value." This is because ArcGIS's WMS GetFeatureInfo requires the parameter `info_format=application/geojson`.

Override Pozi's default `GetFeatureInfo` behaviour as follows:

```json
  "config": {
    "spatial": {
      "params": {
        "info_format": "application/geojson"
      }
```

==- QLD Globe Example

```json
{
  "title": "Society - Schools And School Catchments",
  "group": "Society",
  "type": "WMSGetCapabilities",
  "config": {
    "spatial": {
      "url": "https://spatial-gis.information.qld.gov.au/arcgis/services/Society/SchoolsAndSchoolCatchments/MapServer/WMSServer?&service=WMS&request=GetCapabilities",
      "params": {
        "info_format": "application/geojson"
      }
    }
  }
}
```

==- NSW Example

```json
{
  "title": "EPI Primary Planning Catalogue",
  "group": "EPI Primary Planning",
  "type": "WMSGetCapabilities",
  "config": {
      "url": "https://mapprod1.environment.nsw.gov.au/arcgis/services/Planning/EPI_Primary_Planning_Layers/MapServer/WMSServer?REQUEST=GetCapabilities&SERVICE=WMS"
    },
    "spatial": {
      "params": {
        "format": "image/png8",
        "info_format": "application/geojson"
      }
  },
  "opacity": 0.4
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

The [DataVic WMS GetCapabilities](https://opendata.maps.vic.gov.au/geoserver/wms?request=GetCapabilities) is a 1MB file containing over 600 layers. While it's possible for Pozi to consume this entire catalogue, it will slow down the app load, and the user would see all 600 layers in a single layer group.

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

### WMTS (Web Map Tile Service)

==- Example

```json
{
  "title": "Vicmap Basemaps",
  "group": "Basemap",
  "type": "WMTSCapabilities",
  "config": {
    "spatial": {
      "url": "https://base.maps.vic.gov.au/service?SERVICE=WMTS&REQUEST=Getcapabilities"
    }
  }
}
```

==-

## Settings

### `folder`

When `"folder": true` is specified, the catalogue layers will appear within a layer folder, named after the catalogue title. In this way, multiple catalogues can appear in the one layer group, each with their own folder.

==- Example

In this example, the catalogue layers will appear within a folder called 'Vicmap Admin' within the 'Vicmap' layer group.

```json
{
  "title": "Vicmap Admin",
  "group": "Vicmap",
  "type": "WMSGetCapabilities",
  "config": {
    "spatial": {
      "url": "https://config.pozi.com/public/files/catalogues/deeca-opendataplatform-wms-vmadmin.xml"
    }
  },
  "folder": true
}
```

==-

### `layerFilter`

The `layerFilter` setting allows for managing what layers to show/hide. Only the layers that match the filter will be shown.

The matching is case-insensitive and allows for the use of wildcards for inclusion/exclusion and is based on a software library, called [minimatch](https://github.com/isaacs/minimatch).

It is possible to configure multiple filter rules, separated by a semi-colon (`;`). In that case, **every** filter rule must be satisfied for a layer to be shown! This allows for situations where some exclusions need to apply.

**Example filter settings**:

* `*`: show all layers. This is effectively the same as having no layer filter.
* `vicmap aerial`: only show the layer with this exact name
* `{ vicmap aerial, vicmap cartographic }`: only show the layers called `vicmap aerial` or `vicmap cartographic`
* `vicmap *`: show all the layers that start with `vicmap `
* `vicmap * ; ! *overlay`: show all the layers that start with `vicmap ` excluding any that end with ` overlay`
* `! *overlay`: show all layers excluding any that end with `overlay`
* `! { *aerial, *overlay }`: show all layers excluding any that end with `aerial` or `overlay`
* `{ kinder*, *zones, *bus* }`: show all layers that start with `kinder`, end with `zones` or have the word `bus` anywhere in the layer name
* `! { kinder*, *zones, *bus* }`: hide all layers that start with `kinder`, end with `zones` or have the word `bus` anywhere in the layer name
* `{ *urban*, *commercial*) ; ! { *boundary, *dem* }"`: show all layers that either have `urban` or `commercial` anywhere in their name but exclude any of these matching layers that end with `boundary` or have `dem` anywhere in the name

==- Example

```json
{
  "title": "Transportation - State Road Information",
  "group": "Transportation",
  "type": "WMSGetCapabilities",
  "config": {
    "spatial": {
      "url": "https://spatial-gis.information.qld.gov.au/arcgis/services/Transportation/StateRoadInformation/MapServer/WMSServer?&service=WMS&request=GetCapabilities"
    }
  },
  "layerFilter": "!*not available*"
}
```

==-

### `flatten`

When `"flatten": true` is specified, Pozi will ignore any layer folders specified WMS response, and arrange all layers at the top level of the layer group.
