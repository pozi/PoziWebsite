---
title: Configuration
order: 90
---

# Pozi Connect M1 Configuration

## Basic Configuration Tasks
### Update Vicmap Data Source

1. open `PoziConnect\tasks\[council name]\[council name] M1 - x - Import Vicmap.ini` in a text editor such as Notepad
2. update the settings for:
  * `Vicmap_Address_Folder`
  * `Vicmap_Property_Folder`
3. save file
4. run Pozi Connect and test that it works with the updated file locations
5. send the updated file locations to support@pozi.com for inclusion in future releases

### Working with Alternative Table Names

In 2021-2022, DELWP changed the names of two of the Vicmap Property Simplified 1 tables that Pozi Connect relies upon.

* `PARCEL_MP` > `V_PARCEL_MP`
* `PROPERTY_MP` > `V_PROPERTY_MP`

The March 2022 release of Pozi Connect uses the new table names.

However if your council is still using the old table names, there a couple of approaches to enable Pozi Connect to work with them.

An approach you can take that wouldn't require any changes to Pozi Connect would be to download the PARCEL_MP table twice: once with PARCEL_MP as the destination and once with V_PARCEL_MP as the destination. (And do the same for PROPERTY_MP and V_PROPERTY_MP.)

Or if you don't mind messing with the Pozi Connect config, you can edit the shared Vicmap import config file to use the new table names: `PoziConnect\tasks\~Shared\M1 Shared - Import VMADD and VMPROP SHPs.ini`. But be careful because installing any future release may overwrite your changes in this file.

## Advanced Configuration

This section describes how to set up Pozi Connect to generate M1s for a new site or for an existing site which requires reconfiguration for a new property system.

### Preparation

1. obtain data extract
  * if starting from scratch, install Pozi Connect and run the import task for desired system (eg `M1 Shared - Import Authority.ini`)
  * if site already has a PIQA profile in Pozi Connect, run that and obtain `PlaceLab.sqlite` file
  * if site uses CouncilWise or TechOne OneCouncil, obtain CSV files
2. order and download Vicmap Address and Vicmap Property Simplified 1 datasets in preferred format
3. use Pozi Connect to import council data and Vicmap data into SQLite file

### Customisation

1. create dedicated folder in `PoziConnect\tasks` if it doesn't already exist
2. copy files from similar site into site folder
3. update file names to correspond with site name
4. within INI files, replace all instances of former site name with new site
5. within INI and SQL files, update `lga_code`
6. update `readme.md` to indicate which site was used as the source
7. TODO: add the remaining steps

#### Parcel Crown Descriptions

##### Townships

A parcel's 'Township' attribute important component of a parcel's description. Without the township value, the parcel description is not unique. When it comes to matching properties to parcels, a property that should be in a township might get associated with a parcel outside of the township that has the same lot and section number.

For the purposes of obtaining the correct SPI, it's important to distinguish between parcels that are within the township from those not within.

For instance, these are two completely different parcels:

* Crown Allotment 2011 Parish of Maribyrnong - [2011\PP2516](https://vicmap.pozi.com/?parcelspi=2011\PP2516)
* Crown Allotment 2011 Parish of Maribyrnong Township of Keilor - [2011\PP5412](https://vicmap.pozi.com/?parcelspi=2011\PP5412)
