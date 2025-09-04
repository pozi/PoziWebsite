---
icon: dot
---

# DEECA Web Services

## Image Web Server

### New IWS

[IWS Viewer](https://iws.maps.vic.gov.au/erdas-iws/viewer/index.html)

#### Catalogues

- [WMS](https://iws.maps.vic.gov.au/erdas-iws/ogc/wms/RDP?SERVICE=WMS&REQUEST=GetCapabilities)
- [WMTS](https://iws.maps.vic.gov.au/erdas-iws/ogc/wmts/RDP?SERVICE=WMTS&REQUEST=GetCapabilities)

#### Credentials

Your DataShare account provides access to your organisation's IWS layers.

If you haven't already, sign up for a DataShare account using an email address that belongs to your organisation, ideally a generic one like gis@example.com. Send your DataShare username and password to your Pozi reseller's helpdesk.

​Your username and password are not exposed to the public at all. They reside only on Pozi's proxy server which applies the credentials to each image request that passes through the server. The communication between our proxy server and the IWS is private, so your username and password remain secret.

## MapShare

DEECA's MapShare service is powered by ArcGIS Online.

- [FeatureServer](https://enterprise.mapshare.vic.gov.au/server/rest/services)

There is a known limitation for *What's Here* queries whereby the service cannot return results when there are more than six input geometries (ie, an initial point/line/polygon selection plus five point locations using Ctrl-click).

## Open Data Platform

### Catalogues

- [WMS](https://opendata.maps.vic.gov.au/geoserver/wms?SERVICE=WMS&REQUEST=GetCapabilities)
- [WFS](https://opendata.maps.vic.gov.au/geoserver/wfs?SERVICE=WFS&REQUEST=GetCapabilities)

## Vicmap Basemap

### Catalogue

- [WMTS](https://base.maps.vic.gov.au/service?SERVICE=WMTS&REQUEST=Getcapabilities)
