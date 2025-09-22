---
title: QGIS
route: /qgis
layout: central
---

#

<style>
    .centre {
        text-align: center;
        width: 100%;
        padding: 40px;
        padding-bottom: 10px;
</style>

<!--- START HEADING --->

:::centre

  # Enterprise GIS

  # Powered by QGIS

  <big>**Manage your organisation's geospatial data with QGIS**</big>

  <big>Ultimate control for your corporate GIS - publish spatial and non-spatial datasets, style layers, create data joins, apply geo-processing, and more.</big>

:::

--![](/static/img/screenshots/qgis-to-pozi.png)--

:::centre

<big>**Design in QGIS. Publish in Pozi.**</big>

<big>QGIS is the ultimate toolkit for publishing location-based information to users across your organisation</big>

:::

</br>

## Ultimate control

Use QGIS to easily manage and publish map layers to your users.

Easily apply styling, customise fields, join datasets, and more, all within the familiar QGIS open source desktop application.

* customise your users' Pozi experience
* quickly respond to staff requirements
* build your organisation's in-house capabilities for maintaining GIS configuration
* make it easier for users to discover and access specialised datasets they need

Integrate with local and remote spatial data sources in any format, and build live links to your other non-spatial corporate systems.

<big>On-premise, or cloud - the choice is yours.</big>

</br>

--![Pozi displays a flood model map rendered by QGIS from a CSV file containing spot height values](/static/img/screenshots/swan-hill-flood-model-map-from-csv.png)--

</br>

### Features

* manage spatial and non-spatial datasets
* control layer styling, filtering, thematic maps
* expose/hide data fields, and use field name aliases
* create virtual fields with calculations and text expressions
* create dynamic table joins to link non-spatial data to map layers
* organise map layers in groups and nested folders

</br>

## Enterprise performance from QGIS Server

<img src="/static/img/qgis-logo.png " alt="" style="float:right;width:120px;margin:0px 40px;">

Pozi's QGIS integration is powered by [QGIS Server](https://docs.qgis.org/3.22/en/docs/server_manual/introduction.html).

QGIS Server is a standards-based, open source WMS/WFS server, with the same high performance as MapServer and GeoServer, with the bonus of using QGIS's powerful configuration tools for managing your users' Pozi experience.

QGIS Server is [certified by the OGC](https://www.opengeospatial.org/resource/products/details/?pid=1496) as an [OGC reference implementation](https://blog.qgis.org/2018/06/27/qgis-server-certified-as-official-ogc-reference-implementation/).

</br>

## How it works

### Architecture and Security

QGIS Server is installed on your network (physical or private cloud) as part of the Pozi Server implementation.

Pozi's *hybrid cloud* architecture enables any user to access the Pozi web application and **public** datasets from wherever they are. However internal datasets that you publish with QGIS are available only to authenticated users.

![](/static/draw.io/network-diagram-enterprise-cloud.png)

Users who are signed in to their Microsoft account gain access to corporate data sources that are made available through Microsoft App Proxy.

### Configuration

<img src="/admin-guide/qgis/img/qgis-projects-and-pozi-layer-groups.png" alt="" style="float:right;width:400px;margin:0px 40px;">

Manage and configure your layers in dedicated QGIS projects. The changes you make in the projects are immediately available for Pozi users across your organisation.

Each QGIS project represents a *layer group* in Pozi.

Layer groups can contain nested folders of layers, just as you've configured in QGIS.

<br clear="all" />
</br>

## Advanced Functionality

### Styling

Control the appearance of your map layers using QGIS's advanced styling interface.

Display your data using thematic/categorised colours and/or symbols, with fine-tune control over the layer appearance. Even customise your layer legend.

### Joining

Dynamically join spatial and non-spatial data sources to create combined layers.

For instance, you can maintain your asset location data in a shapefile or spatial database while letting your asset management system take care of all asset attributes and history.

By using dynamic joins, you don't need to duplicate attributes from one source to another, and you don't need scheduled tasks to join them.

QGIS will dynamically join your datasets, and users will see a seamless combination of authoritative spatial and non-spatial information in a single layer.

### And More...

* nested layer groups
* table and field name aliases
* virtual fields

</br>

## Ready to learn more?

:::centre

  <big>Get in touch to discover how to power your GIS with QGIS</big>

:::
