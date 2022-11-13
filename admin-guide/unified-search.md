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


### VRT File Structure

==- Example VRT File

```xml
<?xml version="1.0" encoding="UTF-8"?>
<OGRVRTDataSource>
    <OGRVRTLayer name="ngsc_assets_bridge_id">
        <SrcDataSource>\\Hollop\d\GIS_Data\Active\_NGSC\Assets\Bridges.geojson</SrcDataSource>
        <SrcSQL dialect="sqlite">
            select
                'BRIDGE ASSET ID' as category,
                AssetID || ' ' || cast ( cast ( substr ( AssetID , 4 , 99 ) as integer ) as varchar ) as search_text,
                AssetID as display_text,
                'ngsc_assets_bridges:asset_id:' || AssetID as search_key,
                '' as forward_search_key,
                'bridges' as map_layer,
                'AssetID' as map_layer_id_field,
                AssetID as map_layer_id,
                1 / cast ( ( select count(*) from NGSCBridges ) as float ) as weight,
                round ( st_minx ( st_transform ( geometry , 4326 ) ) , 6 ) as minx,
                round ( st_miny ( st_transform ( geometry , 4326 ) ) , 6 ) as miny,
                round ( st_maxx ( st_transform ( geometry , 4326 ) ) , 6 ) as maxx,
                round ( st_maxy ( st_transform ( geometry , 4326 ) ) , 6 ) as maxy,
                st_transform ( st_pointonsurface ( geometry ) , 4326 ) as geometry
            from
			    NGSCBridges
        </SrcSQL>
        <GeometryType>wkbPoint</GeometryType>
    </OGRVRTLayer>
</OGRVRTDataSource>
```

==-

### VRT File Name

Give the VRT file a name that uniquely identifies its source, dataset and search function.

#### Spatial VRTs

``` Example VRT File Name
ngsc_assets_bridge_id.vrt
```

#### Non-Spatial VRTs

When the search index is created, the VRT files are processed in alphabetical file order. The first VRT file *must* be a dataset that contains feature geometries in order for the search index file to be created correctly.

To ensure that a non-spatial dataset is never processed first, prefix all non-spatial VRT files with `zzz_` to force them to be processed last.

``` Example VRT File Name for Non-Spatial Dataset
zzz_authority_property_owner.vrt
```

### `OGRVRTLayer`

This is a required component for any VRT file. The Unified Search function does not require any specific value. However for the sake of convention, use the same name as the VRT file itself.

```xml Example OGRVRTLayer
<OGRVRTLayer name="ngsc_assets_bridge_id">
```

### `SrcDataSource`

This is the file path or ODBC connection string of the source dataset.

```xml Example file path
<SrcDataSource>\\Hollop\d\GIS_Data\Source\Vicmap\VMFEAT\FOI_POINT.tab</SrcDataSource>
```

```xml Example SQL Server connection string
<SrcDataSource>MSSQL:server=myservername;database=mydatabasename;tables=mytablename</SrcDataSource>
```

```xml Example ODBC connection string
<SrcDataSource>ODBC:DRIVER={SQL Server};SERVER=myservername;DATABASE=mydatabasename,mytablename</SrcDataSource>
```

### `SrcSQL`


### `category`


### `search_text`


The Unified Search doesn't support wildcards. However the index can be configured to take into account some text variations if it is anticipated what the user might type in. (For instance, users searching for a crown allotment can start their query with 'CA' because the parcel search has been configured with a string expression `|| ' CA ' ||` to anticipate this.) If there is a particular search that would require a wildcard, the VRT file can similarly be configured to include the characters that users might type in.

### `display_text`


### `search_key`


### `forward_search_key`


### `map_layer`


### `map_layer_id_field`


### `map_layer_id`


### `weight`


### `minx`, `miny`, `maxx`, `maxy`


### `geometry`




## Troubleshooting

==- Search results are not showing new records

  The source data may be out of date. Open the relevant VRT file in a text editor, identify the source table path in the `OGRVRTLayer` element, navigate to the source table folder, and check the file date.

==-
