---
order: 90
---

# Creating QGIS Projects

## Create Project

!!!

If you have an existing QGIS project that is already configured for Pozi, you can fast-track the steps below.

Save a copy of an existing project, remove all layers (except for any basemap that you might be using as a background layer), and update the `Advertised URL` settings to use the name of the new project file.

!!!

Create new project from scratch:

1. open QGIS
2. Project > Save > specify name and path of new project file (`.qgs`)
3. note the exact file path of project file (needed for subsequent configuration below)

### Add Basemap

It's useful to include a basemap in the project to provide visual context for the layers you will add on top.

#### Example

If you've [set up](/admin-guide/qgis/setting-up-qgis/#basemap) 'Vicmap Basemap' as a WMS/WMTS source, you can easily one of its layers as your basemap.

Browser > WMS/WMTS > Vicmap Basemap > Vicmap Basemap - Web Mercator - Cartographic

![Add Vicmap Basemap](./img/qgis-add-wmts-layer.png){style="width:250px"}

<br/>

## Construct Advertised URL

The project's *Advertised URL* is a URL at which WMS and WFS requests can interact with the layers in the project file. Essentially, the project file needs a reference to itself in a URL format.

Combine the details below to create your project's Advertised URL:

1. server URL (default server URL is `https://local.pozi.com/`, but check your local setup for any custom endpoint)
2. service endpoint (eg `iis/qgisserver?`)
3. QGIS project file path (eg `MAP=C:/Program%20Files%20(x86)/Pozi/userdata/local/property.qgs`)

Combine these three text strings to create the Advertised URL.

Example Advertised URL:

https://local.pozi.com/iis/qgisserver?MAP=C:/Program%20Files%20(x86)/Pozi/userdata/local/property.qgs

Copy the URL to your clipboard or a blank text document for reference. This URL will be used in subsequent configuration below.

<br/>

## Enable Web Services

1. Project > Properties > QGIS Server
2. update WMS capabilities settings
   * `Exclude layers` (tick) > add > pick any background layers you don't need to see in Pozi
   * `Add geometry to feature response`: tick on
   * `Advertised URL`: enter Advertised URL
3. update WMTS capabilities settings
   * `Published layers > Project > Published`: tick on
   * `Advertised URL`: enter Advertised URL
4. update the WFS capabilities settings:
   * `Advertised URL`: enter Advertised URL
5. OK

![QGIS Project Properties WMS Configuration](./img/qgis-project-properties-configuration.png){style="width:600px"}

6. OK
7. Project > Save  (`Ctrl` + `S`)

<br/>

## Further Settings

A comprehensive guide for configuring QGIS projects for publishing layers via WMS/WFS can be found at:

https://docs.qgis.org/latest/en/docs/server_manual/getting_started.html#creatingwmsfromproject

<br/>

## Add Layers

See [Configuring Layers](/admin-guide/qgis/configuring-layers.md) for details about working with layers.

When you're done, remember to [enable any layers for WFS](/admin-guide/qgis/configuring-layers/#enable-wfs) if required.

<br/>

## Register Project

### Obtain GetProjectSettings URL

Construct a `GetProjectSettings` URL by combining the following:

1. Advertised URL from above (eg `https://local.pozi.com/iis/qgisserver?MAP=C:/Program%20Files%20(x86)/Pozi/userdata/local/property.qgs`)
2. GetProjectSettings request: `&service=WMS&REQUEST=GetProjectSettings`

Combine these text strings to create a `GetProjectSettings` URL.

Example `GetProjectSettings` URL:

https://local.pozi.com/iis/qgisserver?MAP=C:/Program%20Files%20(x86)/Pozi/userdata/local/property.qgs&service=WMS&request=GetProjectSettings

Test this URL by pasting it in your browser and check that you get a valid response that lists the available layers.

### Test Project Load Performance

The speed at which Pozi can access layers from the QGIS project is limited by how fast QGIS can access the layers.

To ensure that QGIS is able to access the layers quickly, check the project's performance using QGIS's debugging tool to identify any performance issues.

View > Panels > Debugging/Development Tools > Profiler (clock button)

As soon as you load a QGIS project, a new category called `Project Load` will be available. Select it from the category list.

Expand the entry called `Reading map layers` in the profiler tree to see all of the QGIS project layers and their corresponding loading time.

![QGIS Debug Tool](./img/qgis-debug-layer-load-times.png){style="width:300px"}

If the result show any layer that takes more than a fraction of a second to load, there may be an issue with the network or database that is worth investigating.

[(via GIS StackExchange)](https://gis.stackexchange.com/a/414884)

### Submit Helpdesk Ticket

Email support@pozi.com with these details:

* subject: New layer catalogue
* name of new layer group to appear in Pozi layer panel
* order in which the layer group is to appear in the Pozi Layer Panel (relative to an existing layer group)
* `GetProjectSettings` URL

Within 24 hours, the new layer group will be configured and available for users to view in Pozi.

During this time, and any time afterwards, you may start [adding and configuring layers](/admin-guide/qgis/managing-layers-in-qgis/) in your new project.
