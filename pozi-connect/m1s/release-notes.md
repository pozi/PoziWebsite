---
title: Pozi Connect Release Notes
sidebar_label: Release Notes
order: 100
---

## Pozi Connect 2.10

*March 2023*

In January 2023, the DELWP introduced a subtle change to Vicmap data model that impacted Pozi Connect's ability to differentiate road parcels from normal parcels. As a consequence, Pozi Connect started generating unwanted edits on the M1 related to road parcels.

In this new release, we've adapted Pozi Connect to recognise and filter out road parcels from its results.

## Pozi Connect 2.9

*February 2022*

In October 2021, [DELWP announced](https://www.land.vic.gov.au/maps-and-spatial/maps-and-spatial-news/discover-victorian-spatial-data-with-new-datashare-platform) the retirement of the existing Spatial Datamart service for ordering Vicmap datasets, and moving to the new [DataShare](https://datashare.maps.vic.gov.au/) service. In February 2022, the Spatial Datamart was retired.

Your council's weekly or fortnightly downloads of Vicmap Address and Vicmap Property Simplified 1 must now be set up in DataShare. If you haven't done so already, log in to [DataShare](https://datashare.maps.vic.gov.au/) to set up your new repeat orders of [Vicmap Address](https://datashare.maps.vic.gov.au/search?q=uuid%3Db9e9146d-8378-5c37-b6cd-63e3a8d05d02) and [Vicmap Property Simplified 1](https://datashare.maps.vic.gov.au/search?q=uuid%3Da752b99e-baee-502e-a58b-7d15fa6c57cd).

### What's Different?

The data downloads from DataShare are different to the Spatial Datamart downloads, and we've updated Pozi Connect to cater for these changes. Most critically, the following table names have changed:

* `PARCEL_MP` > `V_PARCEL_MP`
* `PROPERTY_MP` > `V_PROPERTY_MP`

Pozi Connect 2.9 has been updated to use these new DataShare table names. The older Spatial Datamart table names are no longer supported. If you still need to process existing downloads from Spatial Datamart, do not upgrade yet; continue to use Pozi Connect 2.8 until you have set up your DataShare downloads.

### A Note About Folder Names

The new Pozi Connect continues to use your previously configured Vicmap data folder locations.

Pozi Connect may be configured for your council to use `VMADD` and `VMPROP` as your folder names, because these were the folder names inside the old Spatial Datamart zip file. However it's important to note that the folder names inside the DataShare zip files are `VICMAP_ADDRESS` and `VMPROP_SIMPLIFIED_1`. You may need to alter your zip extraction process to take into account the new folder names to ensure that the table files end up in the correct location.

If you decide to extract your DataShare downloads to a different location (for instance, to use the new DataShare folder names), you can change override the location when you run Pozi Connect at the 'Import Vicmap' step by using the folder picker buttons in the Pozi Connect interface and browsing to the new location. You can also modify your council's own 'Import Vicmap' INI file (in `PoziConnect\tasks\[councilname]\`) using a text editor to ensure Pozi Connect remembers the location. And remember, if you make any changes to your INI file, please send the updated file to support@pozi.com so it can be included in future releases.

### Installation

[Download and install the latest Pozi Connect](../installation/)
