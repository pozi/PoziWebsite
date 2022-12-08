---
order: 90
---

# Vector Layers

## Static GeoJSON

==- Example Configuration

  ```json
  {
    "title": "Open Space Consultation",
    "group": "Assets",
    "type": "GeoJSON",
    "about": {
      "organisation": "Northern Grampians Shire Council",
      "url": ""
    },
    "config": {
      "spatial": {
        "loader": "geojson",
        "url": "https://connect.pozi.com/userdata/northerngrampians/public/Community/Consultations/Assets/OpenSpaceConsultation.geojson",
        "label": "name",
        "id": "asset_id"
      }
    },
    "styleGeoStyler": {
      "type": "SLD",
      "url": "https://connect.pozi.com/userdata/northerngrampians/public/Community/Consultations/Assets/OpenSpace.sld"
    },
    "queryable": true,
    "opacity": 0.8
  }
  ```

==-

## WFS (Web Feature Service)

### Sources

#### DELWP DataVic

This service is soon to be retired. See 'DELWP DataVic (New)' below for details about the replacement service.

* [GetCapabilities](https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/wfs?request=getCapabilities)
* [Example GetFeature request](https://services.land.vic.gov.au/catalogue/publicproxy/guest/dv_geoserver/ows?SERVICE=WFS&VERSION=1.1.0&REQUEST=GetFeature&srsName=EPSG%3A4326&typeNames=VMPROP_PROPERTY_ADDRESS&maxFeatures=500&outputFormat=application%2Fjson&CQL_FILTER=INTERSECTS(SHAPE,MULTIPOINT((-37.63734881455353%20142.54281720678077))))

==- Example GetFeature response

  ```json
  {
    "type": "FeatureCollection",
    "totalFeatures": 0,
    "features": [
      {
        "type": "Feature",
        "id": "VMPROP_PROPERTY_ADDRESS.fid--6743268f_18002ec837b_-1ca8",
        "geometry": {
          "type": "MultiPolygon",
          "coordinates": [
            [
              [
                [
                  142.54240828000002,
                  -37.63798631692974
                ],
                [
                  142.5426353,
                  -37.63799418692975
                ],
                [
                  142.54309909,
                  -37.63801027692977
                ],
                [
                  142.5431305,
                  -37.63745822692918
                ],
                [
                  142.54316143,
                  -37.63691479692864
                ],
                [
                  142.54269784000002,
                  -37.63689760692861
                ],
                [
                  142.54247388,
                  -37.63688930692861
                ],
                [
                  142.54240828000002,
                  -37.63798631692974
                ]
              ]
            ]
          ]
        },
        "geometry_name": "SHAPE",
        "properties": {
          "PROP_PFI": "45024104",
          "PROP_LGA_CODE": "362",
          "PROP_PROPNUM": "8812",
          "PROP_STATUS": "A",
          "PROP_UFI": 670906596,
          "PROP_UFI_CREATED": "2022-01-19T21:52:34Z",
          "PROPV_PFI": "373897",
          "PROPV_GRAPHIC_TYPE": "P",
          "ADD_PFI": "54003688",
          "ADD_EZI_ADDRESS": "10 HANSON STREET GLENTHOMPSON 3293",
          "ADD_IS_PRIMARY": "Y",
          "ADD_STATE": "VIC",
          "ADD_POSTCODE": "3293",
          "ADD_LOCALITY_NAME": "GLENTHOMPSON",
          "ADD_NUM_ROAD_ADDRESS": "10 HANSON STREET",
          "ADD_UFI_CREATED": "2009-12-16T01:48:05Z",
          "ADD_LABEL_ADDRESS": "Y",
          "ADD_HOUSE_NUMBER_1": 10,
          "ADD_HOUSE_NUMBER_2": null,
          "ADD_DISP_NUMBER_1": null,
          "ADD_DISP_NUMBER_2": null,
          "ADD_ROAD_NAME": "HANSON",
          "ADD_ROAD_TYPE": "STREET",
          "ADD_ROAD_SUFFIX": null,
          "ADD_BUILDING_NAME": null,
          "ADD_BLG_UNIT_TYPE": null,
          "ADD_NUM_ADDRESS": "10"
        }
      }
    ],
    "crs": {
      "type": "name",
      "properties": {
        "name": "urn:ogc:def:crs:EPSG::4326"
      }
    }
  }
  ```

==-

#### DELWP DataVic (New)

* [GetCapabilities](https://geoserver-uat.maps.vic.gov.au/geoserver/ows?service=WFS&request=getCapabilities)
* [Example GetFeature request](https://geoserver-uat.maps.vic.gov.au/geoserver/ows?SERVICE=WFS&REQUEST=GetFeature&typeNames=open-data-platform:v_property_mp_address&outputFormat=application%2Fjson&CQL_FILTER=INTERSECTS(shape,point(-37.80736%20144.95948)))

#### data.gov.au

* [GeoServer Layer Preview](https://data.gov.au/geoserver/web/wicket/bookmarkable/org.geoserver.web.demo.MapPreviewPage?0)
* [GetCapabilities](https://data.gov.au/geoserver/wfs?SERVICE=WFS&REQUEST=GetCapabilities)
* [Example GetCapabilities for single dataset](https://data.gov.au/geoserver/roadside-conservation-zones-greater-shepparton/wfs?request=GetCapabilities)
* [Example GetFeature Request](https://data.gov.au/geoserver/roadside-conservation-zones-greater-shepparton/wfs?request=GetFeature&typeName=ckan_486a2abd_9144_49bd_bc19_56bf6bf5c8b0&outputFormat=json)

#### Australian Electoral Commission (AEC)

* [Commonwealth Electoral Divisions](https://data.gov.au/geoserver/commonwealth-electoral-divisions-as-at-2-august-2021/wfs?request=GetCapabilities)

#### Pozi Cloud Server

* [Example GetCapabilities](https://d2nozjvesbm579.cloudfront.net/iis/qgisserver?service=WFS&request=GetCapabilities&MAP=C:/Program%20Files%20(x86)/Pozi/server/data/local/sample/queenscliffe/vicmap.qgs)

### Configuration

#### Parameters

##### Request GeoJSON

```json
&outputFormat=json
```

##### Force output to WGS84

```json
&srsName=epsg:4326
```

[Example](https://data.gov.au/geoserver/mitchell-shire-managed-crown-land/wfs?request=GetFeature&typeName=ckan_52af0fe9_9cc5_4770_842a_63f809be1f83&srsName=epsg:4326&outputFormat=json)

## ArcGIS FeatureServer

Obtaining GeoJSON endpoint:

1. Go to dataset's FeatureServer page [[example]](https://www.arcgis.com/home/item.html?id=203951d814374494af36437e19767cbf)
2. Copy URL link from bottom of page [[example]](https://services3.arcgis.com/TJxZpUnYIJOvcYwE/arcgis/rest/services/CILZones/FeatureServer)
3. go to URL, click desired layer from Layer list, and copy URL [[example]](https://services3.arcgis.com/TJxZpUnYIJOvcYwE/ArcGIS/rest/services/CILZones/FeatureServer/0)
4. append parameters (see reference below) [[example]](https://services3.arcgis.com/TJxZpUnYIJOvcYwE/arcgis/rest/services/CILZones/FeatureServer/0/query?f=geojson&outFields=*&where=1=1)

### Parameters

[[Example REST Services API]](https://services3.arcgis.com/TJxZpUnYIJOvcYwE/arcgis/rest/services/CILZones/FeatureServer/0/query?f=html&outFields=*&where=1=1)

#### For Entire Dataset

`/query?f=geojson&outFields=*&where=1=1`

[[Example]](https://services3.arcgis.com/TJxZpUnYIJOvcYwE/arcgis/rest/services/CILZones/FeatureServer/0/query?f=geojson&outFields=*&where=1=1)

#### Set Maximum Features

`&resultRecordCount=1`

[[Example]](https://services3.arcgis.com/TJxZpUnYIJOvcYwE/arcgis/rest/services/CILZones/FeatureServer/0/query?f=geojson&outFields=*&resultRecordCount=1&where=1=1)

#### Specify Fields

`&outFields=*`

Specify `*` or individual field names separated by commas.

#### Change Projection

`&outSR=4283`

Override the default output projection to solve any alignment issues.

#### Spatial Intersection

`/query?f=geojson&outFields=*&returnGeometry=true&inSR=4326&spatialRel=esriSpatialRelIntersects&geometryType=[$esriGeometryType]&geometry=[$esriGeometry]`

[[Example]](https://services3.arcgis.com/TJxZpUnYIJOvcYwE/arcgis/rest/services/CILZones/FeatureServer/0/query?f=geojson&outFields=*&returnGeometry=true&inSR=4326&spatialRel=esriSpatialRelIntersects&geometryType=[$esriGeometryType]&geometry=[$esriGeometry])

#### Complete Reference

[Esri ArcGIS REST APIs Documentation](https://developers.arcgis.com/rest/services-reference/enterprise/query-feature-service-layer-.htm)

### Examples

==- Layer
```json
{
  "title": "Community Infrastructure Levy",
  "group": "Council Facilities and Services",
  "type": "GeoJSON",
  "config": {
    "spatial": {
      "url": "https://services3.arcgis.com/TJxZpUnYIJOvcYwE/arcgis/rest/services/CILZones/FeatureServer/0/query?f=geojson&outFields=*&where=1=1",
      "label": "DCP",
      "id": "$id"
    }
  },
  "opacity": 0.5,
}
```

==- What's Here

```json
{
  "title": "Applicable Community Infrastructure Levy",
  "icon": "img/map-icons/dollar4.svg",
  "type": "GeoJSON",
  "parent": "Whats Here",
  "showInLayerControl": false,
  "config": {
    "spatial": {
      "url": "https://services3.arcgis.com/TJxZpUnYIJOvcYwE/arcgis/rest/services/CILZones/FeatureServer/0/query?f=geojson&outFields=*&returnGeometry=true&inSR=4326&spatialRel=esriSpatialRelIntersects&geometryType=[$esriGeometryType]&geometry=[$esriGeometry]",
      "label": "DCP",
      "id": "$id"
    }
  }
}
```

==-

### On Premise Integration

ArcGIS Online datasets can also be configured for internal use by using VRT configuration.

Examples:

* https://github.com/pozi/PoziConnectConfig/blob/master/Moorabool/SQL/Moorabool%20PC%20Council%20Rural%20Address.vrt
* https://github.com/pozi/PoziConnectConfig/blob/master/Central%20Goldfields/SQL/Central%20Goldfields%20PC%20Council%20Rural%20Address.vrt

## CKAN API

Any CSV data published to data.gov.au is automatically exposed through its CKAN API. The API accepts SQL requests and returns data in a JSON format (not GeoJSON).

When configuring in Pozi, use `"loader": "ckanapi"` to instruct Pozi to convert the results to GeoJSON. If the data contains fields named `x`, `y`, `longitude`, `lng`, `lon`, `long`, `latitude` or `lat`, these are used to generate point geometries in the GeoJSON. Otherwise the geometry is null.

Example requests

* https://data.gov.au/data/api/3/action/datastore_search?resource_id=306f9e0d-581a-4506-8de9-20283f4334a1
* https://data.gov.au/api/action/datastore_search_sql?sql=SELECT%20*%20from%20%22306f9e0d-581a-4506-8de9-20283f4334a1%22

### Allowed Functions

https://github.com/ckan/ckan/blob/master/ckanext/datastore/allowed_functions.txt

As of February 2022, data.gov.au removed support for `CAST()`. Instead, use the `::` syntax for doing type conversions.

```
https://data.gov.au/api/action/datastore_search_sql?sql=select * from "34076296-6692-4e30-b627-67b7c4eb1027" where "Latitude" :: float > -37.07 and "Latitude" :: float < -36.39 and "Longitude" :: float > 144.03 and "Longitude" :: float < 144.86
```

### Examples

==- Layer

```json
{
  "title": "Public Toilets",
  "group": "Council Facilities and Services",
  "type": "GeoJSON",
  "about": {
    "source": "National Public Toilet Map",
    "organisation": "Australian Department of Health",
    "url": "https://data.gov.au/dataset/ds-dga-553b3049-2b8b-46a2-95e6-640d7986a8c1"
  },
  "style": {
    "src": "img/map-icons/white/png-28x28/toilet1.png",
    "bubbleBackground": "#1E90FF"
  },
  "config": {
    "spatial": {
      "loader": "ckanapi",
      "url": "https://data.gov.au/api/action/datastore_search_sql?sql=select * from \"100da45f-6d1d-40ad-8c47-5a0481f1fbf9\" where \"Latitude\" > -37.07 and \"Latitude\" < -36.39 and \"Longitude\" > 144.03 and \"Longitude\" < 144.86",
      "label": "Name",
      "id": "_id"
    }
  }
}
```

==- Non-spatial table lookup

Uses `WARD_NUM` from parent record to do a lookup.

```json
{
  "title": "Councillors",
  "type": "GeoJSON",
  "parent": "Ward and Councillors",
  "showInLayerControl": false,
  "about": {
    "organisation": "City of Bendigo",
    "url": "https://data.gov.au/dataset/ds-dga-7fe44b6d-774e-4888-ba0f-a80cbfdba01c"
  },
  "config": {
    "spatial": {
      "loader": "ckanapi",
      "url": "https://data.gov.au/api/action/datastore_search_sql?sql=SELECT * from \"5560bff7-0f03-4f9b-a2aa-e77898bd3d46\" WHERE \"ward_id\"  IN ('[WARD_NUM]')",
      "id": "ID",
      "label": "name"
    }
  }
}
```

==-

### Submitting CSV files to data.gov.au

Take care when publishing CSV files in data.gov.au to ensure the output from the Data API is current with the uploaded file.

The support team at data.gov.au has provided this information:

> We have found that data in the format csv_geo_au format doesn't trigger the datastore load automatically. It doesn't automatically recognise it as a csv. If you find it doesn't load and if you have access to manage the resource, go to the Datastore tab. Clicking 'Upload to datastore' should update the table.

## Pozi Server

Pozi Server provides an on-premise API for organisations' spatial and non-spatial data.

Running as a Windows service, it responds to http requests generated by Pozi app from users on the client network. It uses `ogr2ogr` to tap into local datasets and return a GeoJSON response.

Requests to Pozi Server can be configured to return whole datastes (eg, to display a map layer), or to return subsets or individual features using paramaterised queries.

`ogr2ogr` resources:

* https://gdal.org/programs/ogr2ogr.html
* https://courses.spatialthoughts.com/gdal-tools.html#ogr-tools

### Examples

* Local install: https://local.pozi.com/ogr2ogr?source=sample/queenscliffe/delwp/vmfeat/foi_point.shp
* Pozi Cloud: https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=data.gov.au/bendigo/cogb-community-mach-zones.shz
* More: https://local.pozi.com/tests?

### Parameters

Any ogr2ogr options can be included as part of any request. A complete list of options is available at [https://gdal.org/programs/ogr2ogr.html](https://gdal.org/programs/ogr2ogr.html).

Notes:

* options are prefixed with `&options=`
* any spaces (that are not within double quotes) must be replaced with a pipe character (`|`)
* exclude any double quotes (ie, such as ones that are part of an `-sql` option)
* if the source table name within a VRT (or SHZ or any other multi-layer dataset) contains spaces:
  * use double quotes around the table name
  * when populating the Pozi config, escape the double quotes with backslashes

Command line example:

```
ogrinfo frankston/council-facilities.vrt -where "type='Maternal and Child Health'"
```

Equivalent Pozi Server request example:

```
.../ogr2ogr?source=frankston/council-facilities.vrt&options=-where|type='Maternal and Child Health'
```

#### Examples

* `https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=data.gov.au/bendigo/cogb-recreation-drinking-fountains.shz`
* `https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=frankston/property-valuation-information.vrt&options=-where|propertynumber='214855'`
* `https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=swanhill/shrccdogwastebags.vrt`

##### Advanced Example

* `https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=data.gov.au/bendigo/cogb-capital-works.shz&options=-sql|select * from "CoGB Capital Works" where BudgetYear='2022-2023' order by Category desc`

The above example is derived from the `ogr2ogr` command which was used for testing the query:

```
ogrinfo cogb-capital-works.shz -sql "select * from ""CoGB Capital Works"" where BudgetYear='2022-2023' order by Category desc"
```

In the Pozi config, the double quotes must be escaped with backslashes

```json
  "config": {
    "spatial": {
      "loader": "geojson",
      "url": "https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=data.gov.au/bendigo/cogb-capital-works.shz&options=-sql|select * from \"CoGB Capital Works\" where BudgetYear='2022-2023' order by Category desc"
```

#### Default Parameters

Pozi Server applies the following parameters by default to all requests:

* `-f GeoJSON`
* `lco RFC7946=YES` ([more info](https://gdal.org/drivers/vector/geojson.html#rfc-7946-write-support))

#### Simplify

Apply geometry generalisation on polyline and polygon features to eliminate unneeded vertices. Note that the simplification unit is based on the *source* data. For sources in degrees, a simplification value of 0.00001 is approximately 1m.

`-simplify 0.00001`

#### Spatial Intersection

#### Unified Search

### Case Studies

#### Filtering Static GeoJSON

A client has uploaded a GeoJSON to data.gov.au that they want displayed in Pozi as separate layers:

[https://data.gov.au/data/dataset/1546593a-44b0-4f5b-a58b-5481e4e4e4c5/resource/478046d4-e8c1-45ad-b31a-f0bea780b054/download/frankston-city-council-facilities.json](https://data.gov.au/data/dataset/1546593a-44b0-4f5b-a58b-5481e4e4e4c5/resource/478046d4-e8c1-45ad-b31a-f0bea780b054/download/frankston-city-council-facilities.json)

A VRT is configured that points to this GeoJSON and enables us to dynamically query it:

```xml Pozi\userdata\ec 21354118232\frankston\council-facilities.vrt
<?xml version="1.0" encoding="UTF-8"?>
<OGRVRTDataSource>
    <OGRVRTLayer name="frankston-city-council-facilities">
        <SrcDataSource>https://data.gov.au/data/dataset/1546593a-44b0-4f5b-a58b-5481e4e4e4c5/resource/478046d4-e8c1-45ad-b31a-f0bea780b054/download/frankston-city-council-facilities.json</SrcDataSource>
        <SrcSQL>
            select *
            from "Frankston City Council Facilities"
        </SrcSQL>
    </OGRVRTLayer>
</OGRVRTDataSource>
```

Note: it's not possible to test this VRT locally as is typically done with an `ogrinfo` or `ogr2ogr` command due to an SSL certificate issue with the https endpoint. (Changing it to http doesn't help either.) However, requests from the outside will utilise the server's SSL certificate and it will work correctly.

[https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=frankston/council-facilities.vrt](https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=frankston/council-facilities.vrt)

Here is an example of a request that returns all features with a "type" value of "Maternal and Child Health":

[https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=frankston/council-facilities.vrt&options=-where|type='Maternal%20and%20Child%20Health'](https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=frankston/council-facilities.vrt&options=-where|type='Maternal%20and%20Child%20Health')

#### Converting CSV to GeoJSON

A client has uploaded a dataset in CSV format to data.gov.au or other online location.

CSV datasets containing coordinate columns can be dynamically converted to GeoJSON using Pozi Server so that the data can be directly consumed within Pozi.

Preparation:

* ensure [Spreadsheet Layers plugin](https://plugins.qgis.org/plugins/SpreadsheetLayers/) is enabled in QGIS
* download CSV locally
* in QGIS, click Layer > Add Layer > Add spreadsheet layer
* specify downloaded CSV
* tick Geometry box and specify the columns to be used for X and Y
* set Reference system to WGS84
* click OK to save VRT

If the CSV is online, and you want Pozi Server to reference the data live from the source, edit the resulting VRT file in a text editor. Within the `SrcDataSource` section, remove the reference to the local CSV and substitute in the CSV's online URL.

```xml Example
<SrcDataSource>https://data.gov.au/data/dataset/8b222b4c-3c6e-4f5f-b4b2-f7581bd6b138/resource/1ba745dc-d1ae-4758-8f85-8423f81f6af0/download/shrccdogwastebags.csv</SrcDataSource>
```

Place the resulting VRT file in a suitable location within the `userdata` folder.

==- Example VRT file

```xml Pozi\userdata\ec 21354118232\swanhill\shrccdogwastebags.vrt
<?xml version="1.0" encoding="UTF-8"?>
<OGRVRTDataSource>
    <OGRVRTLayer name="shrccdogwastebags-shrccdogwastebags">
        <SrcDataSource>https://data.gov.au/data/dataset/8b222b4c-3c6e-4f5f-b4b2-f7581bd6b138/resource/1ba745dc-d1ae-4758-8f85-8423f81f6af0/download/shrccdogwastebags.csv</SrcDataSource>
        <!--Header=False-->
        <SrcLayer>shrccdogwastebags</SrcLayer>
        <Field name="UID" src="UID" type="String"/>
        <Field name="TYPE" src="TYPE" type="String"/>
        <Field name="DESC" src="DESC" type="String"/>
        <Field name="IMAGE" src="IMAGE" type="String"/>
        <GeometryType>wkbPoint</GeometryType>
        <LayerSRS>EPSG:4326</LayerSRS>
        <GeometryField encoding="PointFromColumns" x="LON" y="LAT"/>
    </OGRVRTLayer>
</OGRVRTDataSource>
```

==-

If the VRT is configured on the Pozi Cloud Server, the target URL will look like this:

https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=swanhill/shrccdogwastebags.vrt

---

## Troubleshooting

If the layer doesn't display, check the browser console that it loads successfully. Inspect the contents of the file and check that the coordinates correspond to the expected longitude and latitude values for the general location. GeoJSON must be in WGS84.
