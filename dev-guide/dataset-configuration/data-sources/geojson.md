---
title: GeoJSON
order: 100
---

## Sources

* static GeoJSON files
* WFS
* Pozi Server
* Pozi Cloud Sync

## Example Configuration

==- Layer

  ```json
  {
    "title": "Open Space Consultation",
    "group": "Assets",
    "type": "GeoJSON",
    "about": {
      "organisation": "Northern Grampians Shire Council",
      "url": ""
    },
    "config": {
      "spatial": {
        "loader": "geojson",
        "url": "https://connect.pozi.com/userdata/northerngrampians/public/Community/Consultations/Assets/OpenSpaceConsultation.geojson",
        "label": "name",
        "id": "asset_id"
      }
    },
    "styleGeoStyler": {
      "type": "SLD",
      "url": "https://connect.pozi.com/userdata/northerngrampians/public/Community/Consultations/Assets/OpenSpace.sld"
    },
    "queryable": true,
    "opacity": 0.8
  }
  ```

==- What's Here

  Example goes here

==-

## Troubleshooting

If the layer doesn't display, check the browser console that it loads successfully. Inspect the contents of the file and check that the coordinates correspond to the expected longitude and latitude values for the general location. GeoJSON must be in WGS84.
