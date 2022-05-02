---
title: Pozi Server
---

## API

### Examples

Local install: https://local.pozi.com/ogr2ogr?source=sample/queenscliffe/delwp/vmfeat/foi_point.shp

More: https://local.pozi.com/tests?

Pozi Cloud: https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=data.gov.au/bendigo/cogb-community-mach-zones.shz

### Parameters

https://gdal.org/programs/ogr2ogr.html

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

Apply geometry generalisation on polyline and polygon features to eliminate unneeded vertices. Note that the simplification unit is based on the *source* data. For sources in degrees, a simplication value of 0.00001 is approximately 1m.

`-simplify 0.00001`

#### Spatial Intersection

#### Unified Search

## Case Studies

### Filtering Static GeoJSON

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
