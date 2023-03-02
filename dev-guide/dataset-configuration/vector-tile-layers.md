---
order: 88
---

# Vector Tile Layers

`"type": "VectorTile"`

## MapBox

https://docs.mapbox.com/api/maps/vector-tiles/

==- Example

```json
{
  "title": "Marnoo Flood Contours",
  "group": "Community Engagement",
  "type": "VectorTile",
  "style": {
    "mapbox": "https://api.mapbox.com/styles/v1/ngsc-gis/ckl5pjp194l0017mu2w90ua8m?access_token=clientaccesstoken"
  },
  "config": {
    "spatial": {
      "url": "https://{a-d}.tiles.mapbox.com/v4/ngsc-gis.a0be9k31/{z}/{x}/{y}.vector.pbf?access_token=clientaccesstoken"
    }
  },
  "preventClick": false,
  "opacity": 0.7,
  "minZoom": 15
}
```

==-

## MapTiler GL

==- Example

```json
{
  "title": "MapTiler GL Vector Basemap",
  "group": "Basemap",
  "type": "Mapbox-GL",
  "config": {
    "spatial": {
      "url": "https://api.maptiler.com/maps/streets/style.json?key=ourkey"
    }
  }
}
```

==-

