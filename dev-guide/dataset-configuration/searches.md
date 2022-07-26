---
---

# Searches

## Geocode Earth

### Filter by Municipality

Geocode Earth offers a filter can restrict the address results to a specific municipality.

https://geocode.earth/docs/forward/customization/#restrict-results-by-parent-id

Loddon search:

* [Before - using bounding box](https://api.geocode.earth/v1/autocomplete?text=3%20albert&layers=address,street&boundary.rect.min_lat=-36.91&boundary.rect.min_lon=143.31&boundary.rect.max_lat=-35.91&boundary.rect.max_lon=144.35&api_key=xxxx) - 5 results, including 3 from neighbouring council
* [After - using "county" filter](https://api.geocode.earth/v1/autocomplete?text=3%20albert&layers=address,street&boundary.gid=whosonfirst:county:102049477&api_key=xxxx) - 2 results

In the Geocode Earth results, the municipality is called `county`.

For municipal client site:

* do a search for an address within the municipality and obtain `county_gid` value from the console (eg, whosonfirst:county:102049477)
* update Geocode Earth search config to replace bounding box parameters with `boundary.gid=` parameter
* check results

## HERE

### Search by Coordinates

https://southerngrampians.pozi.com/#/tab[search]/

The HERE geocoder can be used to return results based on coordinates. It can be configured it as its own search option to present the user with an intuitive option and provide example coordinates in the expected format.

==- Example

```json
{
  "title": "Coordinates",
  "group": "",
  "type": "Search",
  "enabled": true,
  "showInLayerControl": false,
  "search": {
    "enabled": true,
    "bbox": [
      [
        141.43,
        -37.088
      ],
      [
        142.62,
        -37.97
      ]
    ],
    "type": "here",
    "caption": "Example: 142.026 -37.541"
  },
  "config": {
    "spatial": {
      "url": "https://geocoder.cit.api.here.com/6.2/search.json?gen=9&app_id=pYZXmzEqjmR2DG66DRIr&app_code=T-Z-VT6e6I7IXGuqBfF_vQ&country=AUS&state=VIC&&searchtext=(searchquery)&bbox=[bboxhereformat]",
      "id": "$id"
    }
  },
  "_key": "layer-60"
}
```

==-

## Mapshare
