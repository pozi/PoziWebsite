---
---

# Searches

## Geocode Earth

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
