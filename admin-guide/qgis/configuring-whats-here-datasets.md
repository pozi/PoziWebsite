---
order: 75
icon: location
---

# Configuring *"What's Here"* Datasets

Pozi's Info Panel displays a set of results called *"What's Here"* whenever the user clicks anywhere on the map (but not directly on any vector feature).

Any datasets that you configure as *What's Here* datasets will always appear in the Info Panel so that users will see information about a location without having to turn on specific layers.

When a user clicks on the map or draws a line or polygon selection, Pozi creates a spatial *target* against which all What's Here datasets will be queried. Pozi fetches any intersecting features from the What's Here datasets and displays them in the Info Panel.

Use cases:

* properties
* administrative zones
* work zones
* council wards
* more...

!!!

Any dataset that is enabled for *What's Here* is essentially a *child* dataset. Learn more about parent/child dataset interaction [here](./configuring-linked-datasets.md).

Instead of the layer's *parent* being a feature in another layer, the parent is a temporary feature that is automatically created when the user clicks on the map (or uses the line or polygon selection tool), often referred to as the *target*.

!!!

## *What's Here* vs Standard Layers

*What's Here* datasets are configured separately from standard layers. When working with core datasets such as property, consider configuring both a What's Here and a standard version of the layer in your QGIS project to cover a range of use cases.

In this example, we'll use a property layer as the source for both a What's Here dataset and a standard layer. Configure the two layers with different names, following the naming convention suggested below.

### Standard Layer

- primary purpose is for layer visualisation
- appears in the layer panel, and the user can turn it on or off
- configuration:
  - use plural naming convention (ie 'Properties')
  - don't enable for WFS (because it's a large dataset)
  - make the layer [NOT queryable](./configuring-layers/#selectability) because the info results will be taken care of by the new dataset below

### What's Here

- always returns a result when the user clicks on the map, regardless of whether the 'Properties' layer (above) is turned on or not
- can support complex selections such as lines, polygons and multi-points
- is not listed in the layer panel
- configuration:
  - use singular naming convention (ie 'Property')
  - enable for WFS
  - configure layer keywords as follows:

Layer > Properties > QGIS Server > Keyword list:

```
parent=Whats Here, parameter=filter=<Filter><Intersects><PropertyName>geometry</PropertyName>[$gml]</Intersects></Filter>
```

Note that `Whats Here` in the settings does NOT contain an apostrophe.

The presence of the `parent=Whats Here` parameter automatically hides the dataset from appearing in the layer panel.

## End Result

Your users can now click anywhere on the map and get property information for that location, regardless of whether the Properties layer is turned on or not.

Additionally, users can use the line and polygon selection tool (as well Ctrl-click for adding spot locations) for selecting properties in a specific area, and generate mail merge for the selected properties.

## Optional Settings

These settings provide an override for some of the default layer behaviours in Pozi. Append any of these overrides to the keyword setting, separated by commas.

* `enabled=false`: temporarily disable a dataset in Pozi (without having to remove it from QGIS)
* `infoPanelCollapse=true`: collapse info results panel for this dataset
* `promoteDetails=true`: display all child attributes instead of a preview

[Developer reference](https://github.com/pozi/PoziApp/blob/master/app/src/config/catalog/KeywordsParser.ts)

---

## Troubleshooting

==- Info Panel doesn't display results tab for new child dataset

Check that the layer is enabled for WFS. In QGIS, go to Project > Properties > QGIS Server > WFS Capabilities > your dataset > Published (tick on), then Save the project.

==-
