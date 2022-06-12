---
title: Imagery
---

Any layer configured with `"group": "Imagery"` will appear in the 'Imagery' layer group (as expected). Layers within this special group are displayed with a radio button to toggle between layers instead of the standard tick boxes.

The topmost imagery layer can be toggled by the Aerial button at the top right of the Pozi map.

## Sources

==- HERE Satellite

  ```json
  {
    "title": "HERE Satellite",
    "group": "Aerial",
    "type": "XYZ",
    "about": {
      "organisation": "HERE Technologies",
      "url": "https://developer.here.com/documentation/map-tile/topics/what-is.html"
    },
    "config": {
      "url": "https://{1-4}.aerial.maps.api.here.com/maptiler/v2/maptile/newest/hybrid.day/{z}/{x}/{y}/256/png8?lg=ENG&app_id=ourappid&token=ourtoken"
    }
  }
  ```

==-
