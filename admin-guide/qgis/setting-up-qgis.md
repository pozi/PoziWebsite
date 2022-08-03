---
description: Configure QGIS desktop to make it easy to publish your layers to Pozi
order: 100
icon: codespaces
---

# Setting Up QGIS

These are the recommended settings for QGIS. They are optional. They only need to be set once.

## Project Settings

Settings > Options > General > Project Files

* Prompt for confirmation when a layer is to be removed: untick
* Default project file format: QGS Project

## Panels and Toolbars

Right-click on any toolbar handle to reveal tickboxes for adding and removing panels and toolbars.

![](./img/qgis-panel-and-toolbar-setup.png){style="width:600px"}

### Panels

* Layer Styling
* Layers
* Browser
* Debugging/Development Tools

### Toolbars

* Attributes
* Map Navigation
* Project
* Selection

## Data Sources

Set up your Browser panel to enable access to commonly-used data sources.

### Layer Files

Add the path of your GIS data folder as a *Favorite* in the QGIS Browser panel for easy access. Learn more [here](https://docs.qgis.org/latest/en/docs/user_manual/introduction/browser.html#favorites).

Browser > Favorites (right-click) > Add a Directory... > navigate to your GIS data folder (use UNC path only!)

Also add a shortcut to the UNC location on your PC desktop for extra convenience.

### Database Connections

Browser > MSSQL (right-click) > New Connection...

### Basemap

![Add Vicmap Basemap](./img/qgis-new-wmts-connection.png){style="width:600px"}

Browser > WMS/WMTS (right-click) > New Connection...

* Name: Vicmap Basemap
* URL: https://base.maps.vic.gov.au/service
* OK
