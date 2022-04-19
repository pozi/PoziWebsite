---
title: WFS (Web Feature Service)
sidebar_label: WFS
---

## Sources

### DELWP DataVic

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

### data.gov.au

* [GeoServer Layer Preview](https://data.gov.au/geoserver/web/wicket/bookmarkable/org.geoserver.web.demo.MapPreviewPage?0)
* [GetCapabilities](https://data.gov.au/geoserver/wfs?SERVICE=WFS&REQUEST=GetCapabilities)
* [Example GetCapabilities for single dataset](https://data.gov.au/geoserver/roadside-conservation-zones-greater-shepparton/wfs?request=GetCapabilities)
* [Example GetFeature Request](https://data.gov.au/geoserver/roadside-conservation-zones-greater-shepparton/wfs?request=GetFeature&typeName=ckan_486a2abd_9144_49bd_bc19_56bf6bf5c8b0&outputFormat=json)

### Australian Electoral Commission (AEC)

* [Commonwealth Electoral Divisions](https://data.gov.au/geoserver/commonwealth-electoral-divisions-as-at-2-august-2021/wfs?request=GetCapabilities)

### Pozi Cloud Server

* [Example GetCapabilities](https://d2nozjvesbm579.cloudfront.net/iis/qgisserver?service=WFS&request=GetCapabilities&MAP=C:/Program%20Files%20(x86)/Pozi/server/data/local/sample/queenscliffe/vicmap.qgs)

## Configuration

### Parameters

#### Request GeoJSON

```
&outputFormat=json
```

#### Force output to WGS84

```
&srsName=epsg:4326
```

[Example](https://data.gov.au/geoserver/mitchell-shire-managed-crown-land/wfs?request=GetFeature&typeName=ckan_52af0fe9_9cc5_4770_842a_63f809be1f83&srsName=epsg:4326&outputFormat=json)
