---
title: Configuration
order: 90
---

# Pozi Connect M1 Configuration

## Update Vicmap Data Source

1. open `PoziConnect\tasks\[council name]\[council name] M1 - x - Import Vicmap.ini` in a text editor such as Notepad
2. update the settings for:
  * `Vicmap_Address_Folder`
  * `Vicmap_Property_Folder`
3. save file
4. run Pozi Connect and test that it works with the updated file locations
5. send the updated file locations to support@pozi.com for inclusion in future releases

## Working with Alternative Table Names

In 2021-2022, DELWP changed the names of two of the Vicmap Poprerty Simplified 1 tables that Pozi Connect relies upon.

* `PARCEL_MP` > `V_PARCEL_MP`
* `PROPERTY_MP` > `V_PROPERTY_MP`

The March 2022 release of Pozi Connect uses the new table names.

However if your council is still using the old table names, there a couple of approaches to enable Pozi Connect to work with them.

An approach you can take that wouldn't require any changes to Pozi Connect would be to download the PARCEL_MP table twice: once with PARCEL_MP as the destination and once with V_PARCEL_MP as the destination. (And do the same for PROPERTY_MP and V_PROPERTY_MP.)

Or if you don't mind messing with the Pozi Connect config, you can edit the shared Vicmap import config file to use the new table names: `PoziConnect\tasks\~Shared\M1 Shared - Import VMADD and VMPROP SHPs.ini`. But be careful because installing any future release may overwrite your changes in this file.
