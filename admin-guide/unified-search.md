---
icon: search
tags: [Pozi Enterprise]
---

# Unified Search

The Unified Search is a general purpose search utility designed to handle common user searches with the Pozi app. Users can type their search into the autocomplete search box and see results such addresses, assets, features of interest, properties, parcels, animal tags and more. Picking a result will zoom the map to the location.

The Unified Search is a specific implementation of the [Pozi Pipeline](./pipeline/) ETL tool. It generates a search index in the form of a SQLite file which Pozi can query to fetch its search results. The process is run on a routine basis to keep the search index up-to-date.

## Configuration

Pozi Pipeline is configured to loop through a folder of VRT files, each of which is a virtual dataset that points to a source dataset and includes specific formatting information that enables the search index to be built.

There is no limit to the number of datasets that can be configured in the search. However, the more that is added, the more potential for the search results of less useful features to crowd out the more important results.

The listed file names will indicate what is currently configured for searching. (Files that contain configurations for non-spatial data sources are prefixed with zzz to force them to the bottom because the spatial ones need to be be processed first.)

### Dataset Configuration in VRT Files

The Unified Search doesn't support wildcards. However the index can be configured to take into account some variations if it is anticipated what the user might type in. (For instance, users searching for a crown allotment can start their query with 'CA' because the parcel search has been configured with a string expression `|| ' CA ' ||` to anticipate this.) If there is a particular search that would require a wildcard, the VRT file can similarly be configured to include the characters that users might type in.

## Troubleshooting

==- Search results are not showing new records

  The source data may be out of date. Open the relevant VRT file in a text editor, identify the source table path in the `OGRVRTLayer` element, navigate to the source table folder, and check the file date.

==-
