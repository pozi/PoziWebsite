---
icon: search
tags: [Pozi Enterprise]
---

# Unified Search

The Unified Search is a general purpose search utility designed to handle common user searches with the Pozi app. Users can type their search into the autocomplete search box and see results such addresses, assets, features of interest, properties, parcels, permit numbers, animal tags and more. Picking a result will zoom the map to the location.

The Unified Search is a custom implementation of the [Pozi Pipeline](./pipeline/) ETL tool. It generates a search index in the form of a SQLite file which Pozi Server can query to fetch its search results. The process is run on a routine basis to keep the search index up-to-date.

## Configuration

To build the Unified Search index, Pozi Pipeline is configured to loop through a folder of VRT files, each of which is a virtual dataset that points to a source dataset and includes specific formatting information that enables the search index to be built.

There is no limit to the number of datasets that can be configured in the search. However, the more that is added, the more potential for the search results of less useful features to crowd out the more important results.

Note: if you want to index multiple fields in the same table, create separate VRT files each target field. For example, one for an asset id and one for an asset name.

### VRT File Name

Give the VRT file a name that uniquely identifies its source, dataset and search function. When done correctly, an alphabetical listing of the VRT files will display them in natural groupings of layers from common sources.

Example: `ngsc_assets_bridge_id.vrt`

#### Non-Spatial VRTs

When the search index is being built, the VRT files are processed in alphabetical file order. The first VRT file *must* be a dataset that contains feature geometries for the search index file to be created correctly.

To ensure that a non-spatial dataset is *never* processed first, prefix all non-spatial VRT files with `zzz_` to force them to be processed last.

Example: `zzz_authority_property_owner.vrt`

### VRT File Structure

==+ Example VRT File

```xml csc_asset_open_spaces_id.vrt
<?xml version="1.0" encoding="UTF-8"?>
<OGRVRTDataSource>
    <OGRVRTLayer name="csc_asset_open_spaces_id">
        <SrcDataSource>MSSQL:server=gisassets.db.cardinia.vic.gov.au;database=GISAssets</SrcDataSource>
        <SrcSQL dialect="sqlite">
            with input as ( 
                select
                    *,
                    st_transform ( shape , 4326 ) as wgs84geometry
                from
                    "sdeadmin.ASSET_OPEN_SPACES"
            )
            select
                'OPEN SPACE' as category,
                cast ( AssetID as varchar ) as search_text,
                cast ( AssetID as varchar ) as display_text,
                'asset_open_spaces:id:' + cast ( AssetID as varchar ) as search_key,
                '' as forward_search_key,
                'openspaces' as map_layer,
                'AssetID' as map_layer_id_field,
                cast ( AssetID as varchar ) as map_layer_id,
                1 / cast ( ( select count(*) from input ) as float ) as weight,
                round ( st_minx ( wgs84geometry ) , 6 ) as minx,
                round ( st_miny ( wgs84geometry ) , 6 ) as miny,
                round ( st_maxx ( wgs84geometry ) , 6 ) as maxx,
                round ( st_maxy ( wgs84geometry ) , 6 ) as maxy,
                st_pointonsurface ( wgs84geometry ) as geometry
            from
                input
        </SrcSQL>
        <GeometryType>wkbPoint</GeometryType>
    </OGRVRTLayer>
</OGRVRTDataSource>
```

==+

### Parameters

#### OGRVRTLayer

This is a required component for any VRT file. The Unified Search function does not need any specific value here. However for the sake of convention, use the same name as the VRT file itself.

Example: `<OGRVRTLayer name="ngsc_assets_bridge_id">`

#### SrcDataSource

The file path or database connection string of the source dataset.

|Data Source|Example|
|--|--|
|File path|`<SrcDataSource>\\Hollop\d\GIS_Data\Source\Vicmap\VMFEAT\FOI_POINT.tab</SrcDataSource>`|
|SQL Server connection string|`<SrcDataSource>MSSQL:server=myservername;database=mydatabasename;tables=mytablename</SrcDataSource>`|
|ODBC connection string|`<SrcDataSource>ODBC:DRIVER={SQL Server};SERVER=myservername;DATABASE=mydatabasename,mytablename</SrcDataSource>`|

#### SrcSQL

The query goes inside this section. Include `dialect="sqlite"` to ensure the queries are processed using the SQLite syntax. (If the dialect setting is not included, the source database (eg SQL Server) will try to process the query, and it may use different syntax and geometry operators.)

Example: `<SrcSQL dialect="sqlite">`

### Input Query

```
select
    *,
    st_transform ( GEOMETRY FIELD NAME , 4326 ) as wgs84geometry
from
    SOURCE TABLE NAME
````

The source table is processed into an internal representation called `input` that is used on the subsequent attribute query. This simplifies the query and helps to avoid duplicate processing on the input geometry.

#### Source Table

* name of source table
* insert after the `from` clause in the input subquery
* prefix with the schema name if the table is in a database schema different to the database default (the default is typically `.dbo`)
* enclose in double quotes to avoid any issues with spaces or non-standard characters

Example: `from "sdeadmin.ASSET_OPEN_SPACES"`

#### Geometry Field

* name of the geometry field in the source data
* for Shapefiles, use `geometry`
* for SQL Server, try `geom` or `shape`
* for other sources, it may be `geometry`, `shape`, `geom` or `the_geom`
* you can use the GDAL Shell to run an `ogringo` command on the source table to return the name of the geometry field
* use the `st_transform` function to force the output geometry to WGS84

Example: `st_transform ( shape , 4326 ) as wgs84geometry`

#### Attribute Query

|Query Field|Description|Example|
|--|--|--|
|`category`|The text that is displayed next to the result in the Pozi search window. It describes to the user what the search text refers to, such as an address, property number, property pfi, bridge id, asset id, etc. This text needs to be enclosed in single quotes.|`'OPEN SPACE ASSET ID' as category`|
|`search_text`|The name of the field (or an expression) that contains the text you want to be searchable. Use a `cast` function to convert any number values to character.|`cast ( AssetID as varchar ) as search_text`|
|`display_text`|The name of the field (or an expression) that contains the text that is displayed in the search results in Pozi. It is typically the same as the `search_text`. Use a `cast` function to convert any number values to character.|`cast ( AssetID as varchar ) as display_text`|
|`search_key`|A unique value for every feature within the search index (ie, unique across all input tables). To ensure each record has a unique search key, include the name of the data source, the name of field being indexed, and the unique value of the feature, each separated by a colon.|`'asset_open_spaces:assetid:' || cast ( AssetID as varchar ) as search_key`|
|`forward_search_key`|For non-spatial records, Pozi needs to know the id of the spatial feature that it is related to. This field contains the unique search key (see `search_key` above) of the related spatial feature.|`'vmprop_property:pr_propnum:' + assessment_number as forward_search_key`|
|`map_layer`|If the search needs to turn on a map layer, this is the layer id used in Pozi. Start with the layer name as it is configured in QGIS, change to lower case, and remove any spaces or special characters.|`'openspaces' as map_layer`|
|`map_layer_id_field`|If the search needs to turn on a map layer, this is the name of the field in the map layer that contains the id value. This text needs to be enclosed in single quotes.|`'AssetID' as map_layer_id_field`|
|`map_layer_id`|If the search needs to turn on a map layer, this is id value that Pozi will use to identify the target feature in the layer. Use a `cast` function to convert any number values to character.|`'cast ( AssetID as varchar ) as map_layer_id`|
|`weight`|When viewing search results, it is usually desirable to see any matching results from datasets with fewer features higher in the results than datasets with more features. This expression generates a value that is the inverse of the number of records in the dataset. The weighting can be adjusted further by increasing or decreasing the numerator.|`1 / cast ( ( select count(*) from input ) as float ) as weight`|
|`minx`, `miny`, `maxx`, `maxy`|For any spatial features, these contain the values of feature's bounding box|`round ( st_minx ( wgs84geometry ) , 6 ) as minx`|
|`geometry`|For any spatial features, this contains a geometry of a point at the centroid or somehwere on the surface of the feature|`st_pointonsurface ( wgs84geometry ) as geometry`|

#### GeometryType

The Unified Search stores all input features as point features. Use `wkbPoint`.

Example: `<GeometryType>wkbPoint</GeometryType>`

## Testing

After constructing your VRT file, open a GDAL Shell command window, and run `ogrinfo [VRT file path] -al -so` to test whether the VRT file is valid.

The GDAL shell can also be useful during the construction of the VRT file. Using the source layer as the input, run `ogrinfo [data source file path or connection string] -al -so` to look at the source data field names, including the name of the geometry field.

## Building and updating search index

In Window Task Scheduler, click Create Basic Task and configure the following:

* Name: eg Pozi Nightly Updater
* Trigger: Daily
* Start: eg 4am
* Action: Start a program
* Program/script: browse to batch file
* Start in: C:\Program Files (x86)\Pozi\userdata\tasks
* Open the Properties dialog for this task when I click Finish: tick on

Additional Settings:

* Change User or Group > set as the domain user that is set up for running Pozi Server
* Run whether user is logged on or not: toggle on
* Finish

Test by right-clicking new scheduled task and selecting Run. Check the Pipeline log file to ensure updates are proceeding as expected.

## Troubleshooting

==- Search results are not showing new records

  The source data may be out of date. Open the relevant VRT file in a text editor, identify the source table path in the `OGRVRTLayer` element, navigate to the source table folder, and check the file date.

==-
