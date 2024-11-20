---
order: 75
icon: location
---

# Configuring *"What's Here"* Datasets

Pozi's Info Panel displays a set of results called *"What's Here"* whenever the user clicks anywhere on the map (but not directly on any vector feature).

Any datasets that you configure as *What's Here* datasets will always appear in the Info Panel (as long as any active profile includes them). Users will see results for What's Here datasets when they click on a location without having to turn on specific layers.

When a user clicks on the map or draws a line or polygon selection, Pozi creates a spatial *target* against which all What's Here datasets will be queried. If the user does a single click on the map, the target appears as a special icon. If the user uses the region or line selection tool, the target appears as a dashed line.

Pozi fetches any intersecting features from the available What's Here datasets and displays them in the Info Panel.

Use cases:

* properties
* administrative zones
* work zones
* council wards
* more...

!!!

Any dataset that is enabled for *What's Here* is essentially a *child* dataset. Learn more about parent/child dataset interaction [here](./configuring-linked-datasets.md).

Instead of the layer's *parent* being a feature in another layer, the parent is a temporary feature called the *target* that is created when the user clicks on the map (or uses the region or line selection tool).

!!!

## *What's Here* vs Standard Layers

*What's Here* datasets can be configured separately from standard layers. When working with large datasets such as property, consider configuring both a What's Here and a standard version of the layer in your QGIS project to cover a range of use cases.

In this example, we'll use a property layer as the source for both a What's Here dataset and a standard layer. Configure the two layers with different names, following the naming convention suggested below.

### Standard Layer

- primary purpose is for visualisation
- appears in the layer panel, and the user can turn it on or off
- configuration:
  - use plural naming convention (ie 'Properties')
  - don't enable for WFS (because it's a large dataset)
  - make the layer [NOT queryable](./configuring-layers/#selectability) because the info results will be taken care of by the new dataset below

### What's Here

- the dataset is considered to be a *child* of the *What's Here* target on the map
- always returns a result when the user clicks on the map, regardless of whether the 'Properties' layer (above) is turned on or not
- can be hidden from the layer panel
- can be configured to be searchable by using the optional `searchFields` keyword
- configuration:
  - use singular naming convention (ie 'Property')
  - enable for WFS
  - configure layer keywords as follows:

Layer > Properties > QGIS Server > Keyword list:

```
parent=Whats Here, showInLayerControl=false
```

Note that `Whats Here` in the settings does NOT contain an apostrophe.

The absence of any `parameter` keyword in this child dataset lets Pozi know that the parent/child relationship is a *spatial intersection* query. To specify a *custom* spatial query (for instance, to apply a buffer around the *What's Here* target), see [here](./configuring-linked-datasets.md#spatial-filter).

## End Result

Your users can now click anywhere on the map and get property information for that location, regardless of whether the Properties layer is turned on or not.

Additionally, users can use the line and polygon selection tool (as well Ctrl-click for adding spot locations) for selecting properties in a specific area, and generate mail merge for the selected properties.

## Optional Settings

These settings provide an override for some of the default layer behaviours in Pozi. Append any of these overrides to the keyword setting, separated by commas.

| Setting | Description |
| --- | --- |
| `enabled=false` | disable a dataset in Pozi |
| `infoPanelCollapse=true` | collapse info results panel for this dataset |
| `promoteDetails=true` | display all child attributes instead of a preview |
| `searchFields=fieldname1;fieldname2` | enable Search options for these fields |
| `initialRevealFields=n` | number of fields to initially display in the Details pane (use `0` to collapse pane) |

[Developer reference](https://github.com/pozi/PoziApp/blob/main/src/config/catalog/KeywordsParser.ts)

---

## Troubleshooting

==- Info Panel doesn't display results tab for new child dataset

Check that the layer is enabled for WFS. In QGIS, go to Project > Properties > QGIS Server > WFS Capabilities > your dataset > Published (tick on), then Save the project.

==-
