---
icon: search
tags: [Pozi Enterprise]
---

# Unified Search

The Unified Search is a general purpose search utility designed to handle common user searches with the Pozi app. Users can type their search into the autocomplete search box and see results such addresses, assets, features of interest, properties, parcels, permit numbers, animal tags and more. Picking a result will zoom the map to the location.

The Unified Search is a specific implementation of the [Pozi Pipeline](./pipeline/) ETL tool. It generates a search index in the form of a SQLite file which Pozi can query to fetch its search results. The process is run on a routine basis to keep the search index up-to-date.

## Configuration

Pozi Pipeline is configured to loop through a folder of VRT files, each of which is a virtual dataset that points to a source dataset and includes specific formatting information that enables the search index to be built.

There is no limit to the number of datasets that can be configured in the search. However, the more that is added, the more potential for the search results of less useful features to crowd out the more important results.

### VRT File Name

Give the VRT file a name that uniquely identifies its source, dataset and search function.

Example: `ngsc_assets_bridge_id.vrt`

#### Non-Spatial VRTs

When the search index is created, the VRT files are processed in alphabetical file order. The first VRT file *must* be a dataset that contains feature geometries in order for the search index file to be created correctly.

To ensure that a non-spatial dataset is never processed first, prefix all non-spatial VRT files with `zzz_` to force them to be processed last.

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

This is a required component for any VRT file. The Unified Search function does not require any specific value. However for the sake of convention, use the same name as the VRT file itself.

Example: `<OGRVRTLayer name="ngsc_assets_bridge_id">`

#### SrcDataSource

This is the file path or ODBC connection string of the source dataset.

|Data Source|Example|
|--|--|
|File path|`<SrcDataSource>\\Hollop\d\GIS_Data\Source\Vicmap\VMFEAT\FOI_POINT.tab</SrcDataSource>`|
|SQL Server connection string|`<SrcDataSource>MSSQL:server=myservername;database=mydatabasename;tables=mytablename</SrcDataSource>`|
|ODBC connection string|`<SrcDataSource>ODBC:DRIVER={SQL Server};SERVER=myservername;DATABASE=mydatabasename,mytablename</SrcDataSource>`|

#### `SrcSQL`

#### `GeometryType`

### Input Query

#### Source Table

* name of source table
* insert after the `from` clause in the input subquery
* prefix with the schema name if the table is in a database schema different to the database default (typically `.dbo`)
* wrap in double quotes to avoid any issues with spaces or non-standard characters

#### Geometry

* name of the geometry field in the source data
* insert in the `st_transform` function
* for Shapefiles, use `geometry`
* for other sources, it may be `geometry`, `shape`, `geom` or `the_geom`

### Query Fields

#### `category`

This is the text that is displayed next to the result in the Pozi search window. It describes what the search text refers to, such as an address, property pfi, bridge id, etc.

#### `search_text`

This is the name of the field (or an expression) that contains the text you want to be searchable.

The Unified Search doesn't support wildcards. However the index can be configured to take into account some text variations if it is anticipated what the user might type in. (For instance, users searching for a crown allotment can start their query with 'CA' because the parcel search has been configured with a string expression `|| ' CA ' ||` to anticipate this.) If there is a particular search that would require a wildcard, the VRT file can similarly be configured to include the characters that users might type in.

#### `display_text`

This is the name of the field (or an expression) that contains the text that is displayed in the search results in Pozi.

It is often the same as the `search_text`, but not always. You may want to display extra information to the user that isn't suitable for being searchable. For instance, if you want the user to search by an animal tag number, you can display the tag number followed by the animal's type or breed, which are not useful attributes for being searchable.

#### `search_key`

This is an expression which constructs a unique value for every feature within the search index (ie, unique across all input tables). To ensure each record has a unique search key, include the name of the data source, the name of field being indexed, and the unique value of the feature.

#### `forward_search_key`

For any non-spatial records that are included in the search index, Pozi needs to know the id of the spatial feature that it is related to.

This field contains the unique search key (see above) of the related spatial feature.

#### `map_layer`

This is the name of the layer as it is known in Pozi. Pozi will then know which layer to turn on when performing the search.

Use lower case and remove any spaces or special characters.

#### `map_layer_id_field`


#### `map_layer_id`


#### `weight`


#### `minx`, `miny`, `maxx`, `maxy`


#### `geometry`

## Testing

Open a GDAL shell command window, and run `ogrinfo [VRT file path] -al -so` to test whether the VRT file is valid.

You may also need to run `ogrinfo [data source file path or connection string] -al -so` to look at the source data field names.

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
