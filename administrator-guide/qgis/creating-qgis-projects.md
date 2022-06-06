---
order: 90
---

# Creating QGIS Projects

## Create Project

!!!

If you have an existing QGIS project that is already configured for Pozi, you can fast-track the steps below.

Save a copy of an existing project, remove all layers, and update WMS/WFS URL settings to include the name of the new project file.

!!!

Create new project from scratch:

1. open QGIS
2. Project > Save > specify name and path of new project file (`.qgs`)
3. note the exact file path of project file (needed for subsequent configuration below)

## Construct `GetCapabilities` URL

Any standards-based GIS server (including QGIS Server) can generate a document that includes details of all the map layers it has. The document is called a `GetCapabilities`, and it is generated as XML.

When Pozi launches in the user's browser, it sends a `GetCapabilities` request to QGIS Server. Pozi uses the response to determine what layers are available.

As part of the project configuration, you must construct a URL for the `GetCapabilities` request and configure this URL within the QGIS project file. Essentially, the project file needs a reference to itself.

Combine the details below:

1. server URL (default server URL is`https://local.pozi.com/`, but check your local setup for any custom endpoint)
2. service and WMS/WFS parameters (eg `iis/qgisserver?service=WMS&request=GetCapabilities`)
3. QGIS project file path (eg `&MAP=C:/Program%20Files%20(x86)/Pozi/userdata/local/property.qgs`)

For example:

https://local.pozi.com/iis/qgisserver?service=WMS&request=GetCapabilities&MAP=C:/Program%20Files%20(x86)/Pozi/userdata/local/property.qgs

Copy your URL to your clipboard or a blank text document for reference. This URL will be used in subsequent configuration below. Note that the URL will not yet return a valid response until the configuration is complete.

## Enable WMS Service

Pozi requires the project to be enabled for WMS.

1. Project > Properties > QGIS Server
2. update WMS capabilities settings
   * `Add geometry to feature response`: tick on
   * `Advertised URL`: enter WMS GetCapabilities URL
3. update WMTS capabilities settings
   * `Published layers > Project > Published`: tick on
   * `Advertised URL`: enter WMS GetCapabilities URL

![QGIS Project Properties WMS Configuration](./img/qgis-project-properties-wms-configuration.png){style="width:600px"}

4. OK
5. Project > Save  (`Ctrl` + `S`)
6. test that you get a valid WMS GetCapabilities response by entering the GetCapabilities request in your browser. 

## Enable WFS Service

WFS (Web Feature Service) provides users with the ability to directly interact with map features.

Advantages:

* cursor changes when hovering over object
* select individual features and display results in Info Panel (without displaying results of features on other layers at the same location)
* enable layers to be interactive using Pozi's filter, report and table view functionality

Disadvantages:

* the browser can be easily overwhelmed when dealing with thousands of features or complex features with thousands of vertices
* labeling for WFS features is not well supported, especially for line features such as roads
* restricting visibility to specific zoom ranges is not supported

As a guideline, use WFS for layers with fewer than 5-10K features.

1. Project > Properties > QGIS Server
2. update the WFS capabilities settings:
   * `Advertised URL`: enter WFS GetCapabilities (similar to WMS request above, but with `WFS` substituted in place of `WMS`)
3. OK
4. Project > Save (`Ctrl` + `S`)
5. test that you get a valid WFS GetCapabilities response by entering the GetCapabilities request in your browser.

## Exclude Base Layer

If your project uses a base layer for background context, you'll want to exclude it from appearing in the layer panel in Pozi.

QGIS > Project > Properties > QGIS Server > WMS Capabilities > Exclude layers (tick) > add > pick layer(s) to exclude > OK

QGIS > Project > Save

## Register Project

Your project is now ready to be registered in Pozi. Email support@pozi.com with these details:

* name of layer group to appear in Pozi layer panel
* order in which the layer group is to appear (relative to an existing layer group)
* choose `WFS` or `WMS` (Note: `WMS/WFS` coming soon)
* GetCapabilities URL

Within 24 hours, the new layer group will be configured and available for users to view in Pozi.
