---
title: Basemaps
---

Any layer configured with `"group": "Basemap"` will appear in the 'Basemap' layer group (as expected). Layers within this special group are displayed with a radio button to toggle between layers instead of the standard tick boxes.

Set `"visible": true` for the default basemap.

## Sources

### Raster Tiles

==- OpenStreetMap

  ```json
  {
    "title": "OpenStreetMap",
    "group": "Basemap",
    "type": "XYZ",
    "about": {
      "organisation": "OpenStreetMap",
      "url": "https://www.openstreetmap.org/about"
    },
    "config": {
      "url": "https://{a-c}.tile.openstreetmap.org/{z}/{x}/{y}.png"
    }
  }
  ```

  Other OpenStreetMap layers are available at https://wiki.openstreetmap.org/wiki/Tile_servers.

==- HERE

  ```json
  {
    "title": "HERE Map",
    "group": "Basemap",
    "type": "XYZ",
    "about": {
      "organisation": "HERE Technologies",
      "url": "https://developer.here.com/documentation/map-tile/topics/what-is.html"
    },
    "config": {
      "url": "https://{1-4}.base.maps.api.here.com/maptiler/v2/maptile/newest/normal.day/{z}/{x}/{y}/256/png8?lg=ENG&app_id=ourappid&token=ourtoken"
    }
  }
  ```

==- Stamen Watercolor

  ```json
  {
    "title": "Stamen Watercolor",
    "group": "Basemap",
    "type": "XYZ",
    "about": {
      "organisation": "Stamen",
      "url": "http://maps.stamen.com"
    },
    "config": {
      "url": "https://stamen-tiles-{a-d}.a.ssl.fastly.net/watercolor/{z}/{x}/{y}.jpg"
    }
  }
  ```

==- Stamen Terrain

  ```json
  {
    "title": "Stamen Terrain",
    "group": "Basemap",
    "type": "XYZ",
    "about": {
      "organisation": "Stamen",
      "url": "http://maps.stamen.com"
    },
    "config": {
      "url": "https://stamen-tiles-{a-d}.a.ssl.fastly.net/terrain/{z}/{x}/{y}.png"
    }
  }
  ```

==- Vicmap (Beta)

  ```json
  {
    "title": "Vicmap (Beta)",
    "group": "Basemap",
    "type": "XYZ",
    "visible": true,
    "about": {
      "source": "Vicmap Maps and Services",
      "organisation": "DELWP",
      "url": "https://www.land.vic.gov.au/maps-and-spatial/data-services/vicmap-basemap/licensing-and-copyright"
    },
    "config": {
      "url": "https://dev-base.maps.vic.gov.au/wmts/CARTO_WM_256/EPSG:3857:256/{z}/{x}/{y}.png"
    }
  }
  ```

  https://dev-base.maps.vic.gov.au/service?SERVICE=WMTS&REQUEST=Getcapabilities

==- Mapscape

  Pozi is not currently licensed for Mapscape. This configuration is for evaluation purposes only.

  ```json
  {
    "title": "Mapscape",
    "group": "Basemap",
    "type": "XYZ",
    "about": {
      "organisation": "Spatial Vision",
      "url": "https://spatialvision.com.au/mapscape/"
    },
    "config": {
      "url": "https://proxy.pozi.com/https://mapscape.maps.em.vic.gov.au/color/{z}/{x}/{y}.png"
    }
  }
  ```

==-

### Vector Tiles

==- MapTiler GL

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
