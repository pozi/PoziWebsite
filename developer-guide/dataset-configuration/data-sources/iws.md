---
title: IWS (Image Web Server)
sidebar_label: IWS
---

## DELWP Image Web Server

* [About](https://www.land.vic.gov.au/maps-and-spatial/imagery/about-image-web-server)
* [Login](http://images.land.vic.gov.au/iwsadmin/)
* [Viewer](http://images.land.vic.gov.au/iws/SimpleExampleNative.htm)

### GetCapabilities

http://images.land.vic.gov.au/ecwp/ecw_wms.dll?service=WMS&request=getcapabilities

Current GetCapabilities is over 13MB in one long line. Use https://stackoverflow.com/questions/3961217/how-do-i-format-xml-in-notepad to format output.

### Outages

Report to gis.helpdesk@delwp.vic.gov.au

## Configuration

==- Single Image Example

  ```json
  {
    "title": "Aerial 2008 Dec (Urban)",
    "group": "Imagery",
    "type": "TileWMSAuth",
    "about": {
      "source": "Victorian Coordinated Imagery Program",
      "organisation": "DELWP",
      "url": "https://www2.delwp.vic.gov.au/maps/maps-and-services/coordinated-imagery-program"
    },
    "linkedLayers": [
      "Vicmap Labels"
    ],
    "config": {
      "url": "https://imageproxy.pozi.com/http://images.land.vic.gov.au/ecwp/ecw_wms.dll",
      "params": {
        "LAYERS": "aerial_bendigo_2008jan06_air_vis_15cm_mga55",
        "STYLES": "",
        "TILED": true,
        "FORMAT": "image/jpeg",
        "authkey": "iws-bendigo"
      }
    }
  }
  ```

==- Multi Image Example

  *Note: each layer name in the `LAYERS` parameter is separated by a comma, and the `STYLES` paramater must contain the same number of commas.*

  ```json
  {
    "title": "Aerial Photo (Latest)",
    "group": "Imagery",
    "type": "TileWMSAuth",
    "about": {
      "source": "Victorian Coordinated Imagery Program",
      "organisation": "DELWP",
      "url": "https://www2.delwp.vic.gov.au/maps/maps-and-services/coordinated-imagery-program"
    },
    "linkedLayers": [
      "Vicmap Labels"
    ],
    "config": {
      "url": "https://imageproxy.pozi.com/http://images.land.vic.gov.au/ecwp/ecw_wms.dll",
      "params": {
        "LAYERS": "aerial_bendigo_2021jan17_air_vis_10cm_mga55,towns_bendigo_2021sep02_air_vis_10cm_mga55,towns_axedale_2021jan18_air_vis_10cm_mga55,towns_elmore_2021jan18_air_vis_10cm_mga55,towns_goornong_2021jan18_air_vis_10cm_mga55,towns_heathcote_2020feb22_air_vis_10cm_mga55,towns_lockwood-south_2021jan17_air_vis_10cm_mga55,towns_marong_2020feb22_air_vis_10cm_mga55,towns_neilborough_2021jan17_air_vis_10cm_mga55,towns_ravenswood_2021jan17_air_vis_10cm_mga55,towns_raywood_2021jan17_air_vis_10cm_mga55,towns_redesdale_2020feb22_air_vis_10cm_mga55,towns_sebastian_2021jan17_air_vis_10cm_mga55,towns_mia-mia_2020feb22_air_vis_10cm_mga55",
        "STYLES": ",,,,,,,,,,,,,",
        "TILED": true,
        "FORMAT": "image/jpeg",
        "authkey": "iws-bendigo"
      }
    }
  }
  ```

==-

## For Clients

Image Web Server account:
http://images.land.vic.gov.au/iwsadmin/

Credentials for the Image Web Server:
http://services.land.vic.gov.au/MyProfile/

If councils don't already have credentials, tell them to get in touch with John White: john.white@delwp.vic.gov.au, 03 9194 0204.

Client credentials: https://github.com/groundtruth/PoziProxy/blob/master/lib/pozi-auth.js

## Troubleshooting

### Not all ecws within same aerial layer displaying

#### Display order

When there are multiple ecws for the same aerial layer the ecw images are displayed as if stacked on top of each other, so the last image in a layer set will be the uppermost when displayed.

#### No spaces allowed in ecw image layer set

When there are multiple ecws for the same aerial layer, separated by commas, no spaces are allowed before and after the commas.  If there is a space then the ecw images after that point in the layer set will not b displayed.

### Get Layer Name

#### Example 1

```
\land\aerial\nth-grampians_2017feb03_air_vis_20cm_mga54.ecw
```
...becomes...
`aerial_nth-grampians_2017feb03_air_vis_20cm_mga54`

#### Example 2

```
\land\aerial\towns\navarre_2016dec23_air_cir_10cm_mga54.ecw
```
...becomes...
`towns_navarre_2016dec23_air_cir_10cm_mga54`

#### Test Non-Password-Protected Layer

There is one layer on IWS which doesn't require any credentials: `satellite_victoria_2000jan01_sat_etm543_30m_vg94`

This could be useful for testing the proxy before we have to start applying credentials.

[Example image](http://images.land.vic.gov.au/erdas-iws/erdas/imagex/?request=image&cache=true&transparent=true&type=jpg&l=3&tx=1&ty=7&ts=256&fill=FFFFFF&quality=60&layers=%2Fimages%2Fland%2Fsatellite%2Fvictoria_2000jan01_sat_etm543_30m_vg94.ecw&style=default&srs=EPSG:3111)
