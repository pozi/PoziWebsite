---
order: 80
icon: stack
---

# Configuring Layers

## Adding Layers

Using your [existing QGIS project](managing-qgis-projects), you can add new layers to publish them to your users.

1. open your project file in QGIS
2. Layer > Add Layer > pick from vector, raster or other options
3. navigate to source (see note about file paths below)
4. Add
5. Close
6. Project > Save (`Ctrl` + `S`)

[QGIS Reference: Opening Data](https://docs.qgis.org/latest/en/docs/user_manual/managing_data_source/opening_data.html#opening-data)

==- About layer file paths

When adding new file-based layers, use the layer's absolute file path (UNC) to ensure that the service under which the QGIS Server is running can recognise the path.

Often your own user account may have certain drives mapped for convenience, so you might be used to working with data using file paths that refer to a drive letter (eg, `S:\` or `V:\`). However, the domain user account that runs QGIS Server often won't have these drives mapped.

A UNC path is an absolute path that is recognised by all user accounts, regardless of what drives are mapped on startup. An example UNC path might look like this:

* `\\ad.hrcc.vic.gov.au\shared\GIS\`
* `\\bs-intra\GIS\`

Add the UNC path of your GIS data folder as a *Favorite* in the QGIS Browser panel for easy access. Learn more [here](https://docs.qgis.org/latest/en/docs/user_manual/introduction/browser.html#favorites). Also add a shortcut to the UNC location on your PC desktop for extra convenience.

==- About layer names

Pozi does not currently support duplicate layer names within a site.

If you have two layers that share a name, [alter the layer name](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#source-properties) on one or both layers in the affected QGIS project(s) so that they are no longer the same.

==-

!!!warning

Some changes may not be available immediately in Pozi. If you encounter an issue such as a recently added or renamed layer not loading, restart the IIS application pool on the server.

Windows > IIS > (select server) > Application Pools > PoziQgisServer > Recycle

![](./img/iis-application-pool-recycle.png){style="width:400px"}

!!!

Some common layer configuration tasks you can do in QGIS include:

* [change layer name](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#source-properties)
* [filter data](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#query-builder)
* [modify fields](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#fields-properties)

<br/>

## Styling Layers

Using QGIS, you can control many visual aspects of your layer.

Reference:

* [basic symbols](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#single-symbol-renderer)
* [thematic styling](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#categorized-renderer)
* [add labels](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/vector_properties.html#labels-properties)

### Styling for Vector Layers

For any layers that are to be made accessible to Pozi as fully interactive *vector* layers (ie, WFS), use only the supported styles specified below. Even if you only intend to serve layer via WMS, keep the styling as simple as possible to make any future transition to WFS easier.

#### Supported

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

#### Not currently supported

* SVG marker symbols
* `diamond` symbol
* symbol rotation
* fill hatching
* label offsets
* label buffer transparency

#### Workaround required

The following items are possible by configuring [virtual fields](https://docs.qgis.org/latest/en/docs/user_manual/working_with_vector/attribute_table.html#virtual-field) in QGIS:

* text expressions in labels (eg, replace all instances of 'UNNAMED' with (blank))
* categorised styling based on a field name that contains spaces

#### Vector Style Tips

* **opacity**
  * any changes to opacity must be set in the style colour setting - the layer's global opacity slider has no effect
  * for polygon features to be selectable, the fill opacity must be greater than `0` - it can be as little as `1%`
* **symbol size**: set to `4mm` or greater enable to easier interaction for users in the browser
* **line thicknesses**: set to `1mm` or greater to enable users to more easily select line features
* **label text size**: set to `10 points` or greater, and a white `1.8mm` buffer for better legibility

<br/>

## Enable Layers for WFS

WFS (Web Feature Service) provides users with the ability to directly interact with map features as *vector* objects. When a WFS layer is turned on in Pozi, every feature from the source dataset is loaded in the browser, including all geometries and attributes.

### Considerations for WFS

#### Advantages

* layers are fully interactive using Pozi's filter, report and table view functionality
* after the layer is loaded in the browser, the browser doesn't not need to send further requests for the layer to the server every time the map moves
* the cursor changes when hovering over object to indicate the feature is clickable
* users can select an individual feature and display its details in Info Panel (without displaying results of features on other layers at the same location)

#### Disadvantages

* the browser can be easily overwhelmed when dealing with thousands of features or complex features with many vertices, resulting in slow map rendering
* not all QGIS styles are supported in Pozi for vector features
* only one vector feature can be selected at a time - info results are not displayed for any features that have been overlapped by another feature
* cannot directly use text expressions for labels (but you can still make use of virtual fields for creating generating label values)
* restricting visibility to specific zoom ranges is not currently supported

As a guideline, enable WFS only for layers with fewer than 5-10K features, or even fewer for layers with complex polylines or polygons.

### Enable WFS

1. Project > Properties > QGIS Server
2. `WFS capabilities > Published`: tick on for each layer to be published, or click `Select All` if all layers are required
3. OK
4. Project > Save (`Ctrl` + `S`)

![QGIS Project Properties WFS Configuration](./img/qgis-project-properties-wfs-configuration.png){style="width:500px"}

<br/>

## Feature Title

When users select a feature from the map, Pozi will pick a value from the selected feature's attributes to display prominently at the top of the Info Panel.

==- Priority Field Names

Pozi dynamically evaluates the selected feature, and attempts to obtain a title value using any fields with any of these names if they exist and if they contain a value:

* `label` or `*label`
* `ezi_address`
* `name` or `*name`
* `title` or `*title`
* `description` or `*description`

*Note: the asterisk above represents a wildcard, meaning that the field name may begin with any text.*

This list is subject to change. [(Developer Notes)](https://github.com/pozi/PoziApp/blob/master/app/src/drawer/tabs/info/Label.ts)

==-

You can manipulate your source data using virtual fields in QGIS to promote your chosen field by using any variation of the priority names.

See https://docs.qgis.org/latest/en/docs/user_manual/expressions/expression.html

<br/>

## Selectability

<small>#selectable #queryable #identifiable</small>

To prevent the Info Panel from displaying results from specific layers (say, for aerial photos), update the `Data Sources` settings in the QGIS project.

Project > Properties > Data Sources > Identifiable > untick to disable layer selectability

<br/>

## Table File Maintenance

If you need to move, rename or delete a table, first remove the layer from any QGIS project to which the layer is registered, then save the QGIS project.

You may then attempt to make any changes to the table file(s). If Windows prevents you from making any changes, stop the IIS service that is locking the files.

Windows > IIS > (select server) > Application Pools > PoziQgisServer > Stop

You may also need to stop any other services that start with `PoziQgisServer`.

Restart the service(s) after you make your changes.

<br/>

## Troubleshooting

==- Layer features are not displayed when the layer is turned on

Check the following:

* If your project is configured as a WFS source, check that the layer is enabled for WFS. Go to Project > Properties > QGIS Server > WFS Capabilities > your layer > Published (tick on)
* Pozi is only able to display features that have at least one valid/non-null attribute. If any records in your data contain no attributes, populate some values into one of the fields.
* Ensure the layer has a coordinate reference system set. Go to Layer Properties > Source > Assigned CRS, and pick a projection

==- Layers are not displayed with the styling from QGIS

Pozi will display layers in a generic style if it cannot process the style that was configured in QGIS.

Simplify the style in the QGIS project and try again. Replace hatch styles with semi-opaque fills. Replace custom point symbols with one of the standard symbols specified above.

==- Layers are slow to load

Use QGIS to determine whether the layer also causes its project file to load slowly. Observe the progress bar at the bottom to see if any layers are taking more than a fraction of a second to load in QGIS. If it appears that a layer is taking longer, check the source data. If it's from a database view, check that any join fields are properly indexed.

![](img/qgis-project-loading-status.png)

[!ref text="Testing Load Performance"](/admin-guide/qgis/managing-qgis-projects#test-project-load-performance)

==-
