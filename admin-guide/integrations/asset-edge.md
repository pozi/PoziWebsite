---
description: GIS integration for Asset Edge Reflect
icon: dot
tags: [Pozi Enterprise, Loddon Shire Council]
---

# Asset Edge

Asset Edge's [Reflect](https://www.assetedge.com.au/product/reflect---inspection-and-maintenance-management-software) inspection and maintenance management software is utilised by local and state governments across Australia.

![](/static/img/tweet-gallery/Loddon_Reflect_Defects.png)

## Configure Source in QGIS

1. QGIS > Layer > Add Layer > Add Vector Layer
2. Source Type: Protocol: HTTP(S), cloud, etc
3. Protocol Type: GeoJSON
4. URI: your Asset Edge Reflect API URL

Note: if the URL supplied to you contains `Kml3=`, replace it with `GeoJson=`.

![](img/assetege-reflect-add-layer.png){style="width:400px"}

Preview your new layer, and give it a user-friendly layer name.

![](img/assetege-reflect-preview-and-rename-layer.png){style="width:400px"}
