---
order: 80
---

# Managing Layers in QGIS

## Adding Layers

Using your [existing QGIS project](creating-qgis-projects), you can add new layers to publish them to your users.

1. open your project file in QGIS
2. Layer > Add Layer > pick from vector, raster or other options
3. navigate to source (see note about file paths below)
4. Add
5. Close
6. Project > Save (`Ctrl` + `S`)

[QGIS Reference: Opening Data](https://docs.qgis.org/latest/en/docs/user_manual/managing_data_source/opening_data.html#opening-data)

==- A note about layer file paths

When adding new file-based layers, we recommend to use the layer's absolute file path (UNC) to ensure that the service under which the QGIS Server is running can recognise the path.

Often your own user account may have certain drives mapped for convenience, so you might be used to working with data using file paths that refer to a drive letter (eg, `S:\` or `V:\`). However, the domain user account that runs QGIS Server often won't have these drives mapped.

A UNC path is an absolute path that is recognised by all user accounts, regardless of what drives are mapped on startup. An example UNC path might look like this:

* `\\ad.hrcc.vic.gov.au\shared\GIS\`
* `\\bs-intra\GIS\`

Add the UNC path of your GIS data folder as a *Favorite* in the QGIS Browser panel for easy access. Learn more [here](https://docs.qgis.org/latest/en/docs/user_manual/introduction/browser.html#favorites). Also add a shortcut to the UNC location on your PC desktop for extra convenience.

==-

!!!warning

Some changes may not be available immediately in Pozi. If you encounter an issue such as a recently added or renamed layer not loading, restart the IIS application pool on the server.

Windows > IIS > (select server) > Application Pools > PoziQgisServer > Recycle

![](./img/iis-application-pool-recycle.png){style="width:400px"}

!!!

## Configuring Layers

Some common layer configuration tasks that can be carried out in QGIS include:

* [change layer name](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#source-properties)
* [filter data](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#query-builder)
* [modify fields](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#fields-properties)

## Styling Layers

Reference:

* [basic symbols](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#single-symbol-renderer)
* [thematic styling](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#categorized-renderer)
* [add labels](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#labels-properties)

Styling options supported by Pozi:

* simple points, lines, polygons symbolisers
  * `square`
  * `circle`
  * `triangle`
  * `star`
  * `cross`
  * `x`
* rule-based styles
* basic labels
* customisable legend text

Not currently supported:

* `diamond` symbol
* SVG marker symbols
* fill hatching
* label offsets
* rules based on a field name that contains spaces

Tips:

* opacity must be defined in the colour - the layer's global opacity slider has no effect
* for polygon features to be selectable, the fill opacity must be greater than `0` - it can be as little as 1%

## Enable Layers for WFS

As a guideline, enable WFS only for layers with fewer than 10-20K features.

1. Project > Properties > QGIS Server
2. update the following settings:
   * `WFS capabilities > Published`: tick on for each layer to be published
3. OK
4. Project > Save

![Screenshot of QGIS Project Properties WFS Configuration](./img/qgis-project-properties-wfs-configuration.png){style="width:600px"}

## Table File Maintenance

If you need to move, rename or delete a table, remove the layer from any QGIS project to which the layer is registered, then save the QGIS project.

You may then attempt to make any changes to the table file(s). If Windows prevents you from making any changes, stop the IIS service that is locking the files.

Windows > IIS > (select server) > Application Pools > PoziQgisServer > Stop

You may also need to stop any other services that start with `PoziQgisServer`.

Restart the service(s) after you make your changes.

## Troubleshooting

==- Layer features are not displayed when the layer is turned on

Pozi is only able to display features that have at least one valid/non-null attribute.

If any records in your data contain no attributes, populate some values into one of the fields.

==-
