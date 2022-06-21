---
title: Unified Search
---

:::note Under Construction

*This page is a work in progress. Please refer to our existing Help Guide for information about this topic.*

[Existing Help Guide](https://help.pozi.com/)

:::

---

The Unified Search is a general purpose search utility designed to handle common search workflows. There is no limit to the number of datasets that can be configured in the search. However, the more that is added, the more potential for the search results of less useful features to crowd out the more important results.

## Configuration

The listed file names will indicate what is currently configured for searching. (Files that contain configurations for non-spatial data sources are prefixed with zzz to force them to the bottom because the spatial ones need to be be processed first.)

### Dataset Configuration in VRT Files

The Unified Search doesn't support wildcards. However the index can be configured to take into account some variations if it is anticipated what the user might type in. (For instance, users searching for a crown allotment can start their query with 'CA' because the parcel search has been configured to anticipate this.) If there is a particular search that would require a wildcard, the VRT file can be configured to include the characters that users might type in.

## Troubleshooting

==- Search results are not showing new records

  The source data may be out of date. Open the relevant VRT file in a text editor, identify the source table path in the OGRVRTLayer element, navigate to the source table folder, and check the file date.

==-
