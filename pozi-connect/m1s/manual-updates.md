---
title: Manual Updates
---

# Pozi Connect M1 Manual Updates

In some scenarios, Pozi Connect is not able to generate an appropriate update. You can manually update the M1 spreadsheet to give you the outcome you want.

Below are some edits you can make. For all other enquiries with manual M1 updates, please contact gis.helpdesk@delwp.vic.gov.au for assistance.

### Update distance-based address

You may encounter a scenario where Pozi Connect will notify you in the `comments` field of your M1 about a 'P' edit that is likely to be rejected by DEECA. This is because the existing location of a primary distance-based address is within a parcel that Pozi Connect is trying to transfer out of the property.

The warning appears as:

`**WARNING**: transfer of parcel includes existing primary distance-based address`

The solution is to submit a manual M1 address update ('S' edit) to update the coordinates of the property's primary address so it falls within any of the parcels that are still owned by the property and is **not within any parcel that you're trying to transfer out of the property**.

Use your GIS or [Pozi's dedicated M1 map](https://vicmap.pozi.com/) to obtain the coordinates of the updated property entrance.

Obtaining coordinates using Pozi:

1. locate the property on the map
2. click the Aerial button at the top right of the page
3. click on property entrance approximately 8m inside the property boundary
4. at the botton of the *What's Here* panel, click on the 'Location/Dimensions' tab
5. select your local datum (currently supported datums are MGA54 and MGA55)
6. copy the easting and northing values

Add a row at the bottom of your next M1 with the following columns filled in:

* `lga_code`
* `propnum`
* `house_number_1` (the house number may need to change if the existing number no longer represents 10x distance along the road of the updated property entrance)
* `road_name`
* `road_type`
* `locality_name`
* `distance_related_flag` (Y)
* `is_primary` (Y)
* `easting`
* `northing`
* `datum_proj` MGA54 or MGA55
* `edit_code` (S)

### Update parcel that has no SPI

Add rows to the bottom of the M1.
​
To update the property number, populate the following cells:
​
* `lga_code`
* `parcel_pfi`
* `propnum`
* `edit_code` (P)

To update the parcel number (crefno), populate the following cells:​​

* `lga_code`
* `parcel_pfi`
* `crefno`
* `edit_code` (C)
