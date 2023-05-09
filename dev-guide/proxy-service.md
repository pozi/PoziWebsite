---
title: Proxy Service
order: 50
---

## CORS

For data services that do not have [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) enabled, Pozi Proxy can route data requests from Pozi users to satisfy the provider's restrictions.

Examples:

* Jotform
* GeoSciences Australia WFS
* Mapscape Basemap
* Google Spreadsheets

## Services Requiring Authentication

Some third party data services require that credentials or a key be appended to any data request. In order to keep these credentials out of public view, these requests can be routed via Pozi Proxy, which adds the necessary credentials.

* Nearmap
* DEECA Image Web Server
* Google Maps API (for Street View imagery)
* Geocode Earth
* HERE
* Pingdom status check

Credentials can be added/updated [here](https://github.com/pozi/PoziProxy/blob/master/lib/pozi-auth.js).
