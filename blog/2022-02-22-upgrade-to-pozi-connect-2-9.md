---
slug: upgrade-to-pozi-connect-2-9
author: Simon O'Keefe
tags: [Pozi Connect]
description: An announcement for users of Pozi Connect.
category: Pozi Connect
---

# Upgrade to Pozi Connect 2.9

*An announcement is for users of the Pozi Connect desktop application.*

Pozi Connect 2.9.3 is now available for you to download and install.

We've enhanced Pozi Connect to work with DELWP's new DataShare Vicmap data downloads. We've also taken the opportunity to improve other aspects of Pozi Connect's M1 workflow to give you better quality M1s than ever before. Download and install the latest Pozi Connect now!

**[Upgrade to Pozi Connect 2.9](/pozi-connect/installation.md)**

------

## What's New?

The v2.9 release contains the following changes since the February 2020 (v2.8) release:

- support for new Datashare data supplies
- prevent property number updates where existing address is a complex site
- include parcel pfi for proposed parcels
- populate floor type only if floor number exists
- don't trigger update for unit type if unit number doesn't exist
- improve handling of building/complex name changes
- ensure property_pfi is not empty for A edits
- remove distance_related_flag when house number is blank
- don't populate building names greater than 45 characters
- populate road name with existing road name from Vicmap if council road name is a close match but not an exact match
- remove rural address when house number is blank
- prevent Comments being null when address isn't perfectly formed
- improve Comments for A edits to show which parcel is shared
- update all references from Groundtruth to Pozi
- upgrade GDAL library to v3.1.4
- various bug fixes
- update Help link to new docs site

## New DataShare Vicmap Datasets

In October 2021, [DELWP announced](https://www.land.vic.gov.au/maps-and-spatial/maps-and-spatial-news/discover-victorian-spatial-data-with-new-datashare-platform) the retirement of the existing Spatial Datamart service for ordering Vicmap datasets, and moving to the new [DataShare](https://datashare.maps.vic.gov.au/) service. In February 2022, the Spatial Datamart was retired.

Your council's weekly or fortnightly downloads of Vicmap Address and Vicmap Property Simplified 1 must now be set up in DataShare. If you haven't done so already, log in to [DataShare](https://datashare.maps.vic.gov.au/) to set up your new repeat orders of Vicmap Address and Vicmap Property Simplified 1.

### What's Different?

The data downloads from DataShare are different to the Spatial Datamart downloads, and we've updated Pozi Connect to cater for these changes. Most critically, the following table names have changed:

- `PARCEL_MP` > `V_PARCEL_MP`
- `PROPERTY_MP` > `V_PROPERTY_MP`

Pozi Connect 2.9 has been updated to use these new DataShare table names. The older Spatial Datamart table names are no longer supported. If you still need to process existing downloads from Spatial Datamart, do not upgrade yet; continue to use Pozi Connect 2.8 until you have set up your DataShare downloads.

### A Note About Folder Names

The new Pozi Connect continues to use your previously configured Vicmap data folder locations.

Pozi Connect may be configured for your council to use `VMADD` and `VMPROP` as your folder names, because these were the folder names inside the Spatial Datamart zip file. However it's important to note that the folder names inside the DataShare zip files are `VICMAP_ADDRESS` and `VMPROP_SIMPLIFIED_1`. You may need to alter your zip extraction process to take into account the new folder names to ensure that the table files end up in the correct location.

If you decide to extract your DataShare downloads to a different location (for instance, to use the new DataShare folder names), you can change override the location when you run Pozi Connect at the 'Import Vicmap' step by using the folder picker buttons in the Pozi Connect interface and browsing to the new location. You can also modify your council's own 'Import Vicmap' INI file (in `PoziConnect\tasks\[councilname]\`) using a text editor to ensure Pozi Connect remembers the location. And remember, if you make any changes to your INI file, please send the updated file to support@pozi.com so it can be included in future releases.

------

## Install Pozi Connect 2.9 Now

The new Pozi Docs site provides step-by-step instructions for downloading and installing Pozi Connect 2.9.

**[Get Pozi Connect 2.9](/pozi-connect/installation.md)**

For assistance with this upgrade, contact support@pozi.com.
