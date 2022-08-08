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

### Filter by Bounding Coordinates

==- Example

```json
{
  "title": "Address",
  "group": "",
  "type": "Search",
  "showInLayerControl": false,
  "search": {
    "enabled": true,
    "id": "address",
    "autocomplete": true,
    "type": "mapzen",
    "bbox": [
      [
        145.13,
        -37.92
      ],
      [
        145.26,
        -38.09
      ]
    ]
  },
  "config": {
    "spatial": {
      "url": "https://api.geocode.earth/v1/autocomplete?text=(searchquery)&layers=address,street&boundary.rect.min_lat=[min_lat]&boundary.rect.min_lon=[min_lon]&boundary.rect.max_lat=[max_lat]&boundary.rect.max_lon=[max_lon]&api_key=ge-39bfbedc55be11c0",
      "id": "$id"
    }
  }
}
```

==-

## HERE

### Search by Address

==- Example

```json
{
  "title": "Address",
  "group": "",
  "type": "Search",
  "showInLayerControl": false,
  "search": {
    "id": "address",
    "type": "here",
    "titlecase": true,
    "bbox": [
      [
        145.36,
        -37.86
      ],
      [
        145.78,
        -38.34
      ]
    ],
    "enabled": true
  },
  "config": {
    "spatial": {
      "url": "https://geocoder.cit.api.here.com/6.2/search.json?gen=9&app_id=pYZXmzEqjmR2DG66DRIr&app_code=T-Z-VT6e6I7IXGuqBfF_vQ&country=AUS&state=VIC&&searchtext=(searchquery)&bbox=[bboxhereformat]",
      "id": "$id"
    }
  }
}
```

==-

### Search by Coordinates

https://southerngrampians.pozi.com/#/tab[search]/

The HERE geocoder can be used to return results based on coordinates. For instance, a user can type `142.026 -37.541` into the standard HERE geocoder box to navigate to the desired location.

A separate search option can be configured in Pozi as its own search option to present the user with an intuitive option and provide example coordinates in the expected format.

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
