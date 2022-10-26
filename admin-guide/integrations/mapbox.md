---
description: GIS integration for Mapbox
icon: dot
tags: [Wimmera Catchment Management Authority, City of Greater Bendigo]
---

# Mapbox

Mapbox is a powerful geospatial data hosting and publishing service.

![](/static/img/screenshots/wcma-flood-investigations.png)

## Data Preparation

Convert your data to `mbtiles` format.

```batch
ogr2ogr -f MBTILES contour-400k.mbtiles .\contour.shp -dsco MINZOOM=14 MAXZOOM=16 -dsco MAX_SIZE=400000
```

* `MAX_SIZE` setting is recommended because without it, the tilesize can exceed 500kb, which Mapbox rejects
* setting a `MINZOOM` is recommended for datasets with dense information such as contours to avoid rendering too much information at zoom levels where it's not practical to view


Upload your `mbtiles` file to Mapbox, and style it using Mapbox Studio. Obtain your API key and send it to support@pozi.com.
