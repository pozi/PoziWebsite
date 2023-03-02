---
order: 90
---

# Dataset Configuration

## Schema

See https://github.com/pozi/PoziApp/blob/master/app/src/ConfigManager/schemas/layer-schema.json

## Dataset Types

### Catalogues

```
QGISProjectSettings
WFSGetCapabilities
WMSGetCapabilities
```

### Individual Datasets

```
GeoJSON
Image
ImageWMS
Search
TileWMS
TileWMSAuth
Mapbox
Mapbox-GL
Mapbox-OLSM
VectorTile
Vicmap
XYZ
```

## Basic Example

```json
{
  "title": "Maternal and Child Health Zones",
  "group": "Family Services",
  "type": "GeoJSON",
  "config": {
    "spatial": {
      "url": "https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=data.gov.au/bendigo/cogb-community-mach-zones.shz",
      "label": "Name",
      "id": "Name"
    }
  },
  "styleGeoStyler": {
    "type": "SLD",
    "url": "https://config.pozi.com/public/files/cogb_mach_zones.sld"
  },
  "opacity": 0.8,
  "queryable": true,
  "showInLayerControl": true
}
```

## Settings

* `"title":` use plural name where practical
* `"group":` the name of the layer group in which the layer will appear in the layer panel

### Options

#### Enabled

Set to `false` to prevent the dataset from being configured in Pozi. The default value is `true`.

```json
  "enabled": false,
```

This setting goes beyond simply hiding the layer as per the `showInLayerControl` setting. It causes Pozi to completely ignore the dataset and make it unavailable as a layer or child dataset. In the case of the source being a catalogue, it will prevent Pozi from sending a GetCapabilities request.

#### Queryable

Control whether the features in this layer are queryable/selectable by the user clicking in the map.

```json
  "queryable": true,
```

#### Opacity

```json
  "opacity": 0.7,
```

#### Metadata

```json
  "about": {
    "source": "National Public Toilet Map",
    "organisation": "Australian Department of Health",
    "url": "https://data.gov.au/dataset/ds-dga-553b3049-2b8b-46a2-95e6-640d7986a8c1"
  },
```

#### Zoom Levels

```json
  "minZoom": 16,
  "maxResolution": 4
```

#### Prevent Click

```json
  "preventClick": true
```

#### Include Fields

```json
  "config": {
    "spatial": {
      "include": [
        "ADD_EZI_ADDRESS",
        "PROP_PROPNUM",
        "PROP_STATUS",
        "PLANNING PROPERTY REPORT"
      ]
    }
  }
```

#### Exclude Fields

Attributes from the source data can be hidden from the info panel display by specifying the fields in an `exclude` array, nested under the `spatial` setting.

```json
  "config": {
    "spatial": {
      "exclude": [
        "type",
        "subtype"
      ]
    }
  }
```

#### Linked Layers

Trigger another layer to turn on when the configured layer is turned on. Useful for displaying a label layer on top of aerial photo layers.

```json
  "linkedLayers": [
    "Vicmap Labels"
  ]
```

#### Transformers

##### Point on Surface

A `pointOnSurface` transformer enables Pozi to dynamically filter a vector layer to be display only the results that intersect with the current What's Here target geometry.

```json
    "transformer": {
      "pointOnSurface": true
    }
```

##### Rename and Order Fields

```json
    "transformer": {
      "renameAndOrderFields": [
        {
          "wetland_no": "Wetland Number"
        },
        {
          "name_main": "Name"
        },
        {
          "name_alt": "Name (Alternate)"
        },
```

##### Garbage

If the source dataset complies with the [OpenCouncilData waste data spec](http://standards.opencouncildata.org/#/garbage-collection-zones), Pozi will use the information in the table to calculate and display the next waste collection date.

```json
    "transformer": {
      "garbage": true,
      "renameAndOrderFields": [
        {
          "rubbish_next_pickup": "Next Rubbish Pickup"
        },
        {
          "recycling_next_pickup": "Next Recycling Pickup"
        },
        {
          "green_waste_next_pickup": "Next Organics Pickup"
        }
      ]
    }
```

#### Promote Details

Display the feature's attributes (which would normally be displayed in the Details panel of the child record) directly in within the parent, taking the place of the child title.

```json
  "promoteDetails": true
```

Only to be used when there is no requirement to view Location/Dimensions, Source or any child records.

## Dataset Ordering

### Layer Groups

The order of layers in the Pozi layer panel is influenced by the order in which the dataset appears in the Config Manager dataset list. The order of an individual layer is also affected by the layer's `group` setting, and whether the group name is shared with any layer configured above it.

The top layer in the list will generate a layer group based on the layer's `group` setting. Any other layer configured with the same group name, regardless of how far down the list it appears, will be included in this same group.

### Recommended Ordering

* private layer catalogues
* standard layers
* Whats Here/child datasets
  * street view
  * property/address
  * other
  * "nearby"
* label layer
* imagery layers
* basemaps
* searches

### Whats Here

Because `Whats Here` layers are configured to be hidden from the layer panel, it typically doesn't matter where in the order they are defined. *However*, any "Nearby" datasets configured will display in the map as a normal layers. For this reason, these datasets need to be configured above the basemap, aerial and label layers.

To ensure that WMS GetFeatureInfo results appear at the top of the Info Panel, move any "Whats Here" layers below any layers that might be queryable via WMS GetFeatureInfo.

### Imagery

The topmost layer in Imagery group will be activated when the user clicks the Aerial photo button in the map.

Layers in the Imagery group are listed with radio buttons instead of tickboxes.

### Searches

* the topmost search dataset becomes the default search presented to the user
* if the topmost search dataset(s) are private, public users will have the topmost non-private search as their default

Layers in the Basemap group are listed with radio buttons instead of tickboxes.

## Miscellaneous

### Link-Out

#### Web Application

```json
  "externalLinks": [
    {
      "url": "http://communityhub.loddon.vic.gov.au/public/processExternalAction.aspx?element=assessmentid&source=pozi&id=[identifiers]",
      "label": "Send to Open Office",
      "propertyName": "Property Number",
      "localDataSource": true
    }
  ],
```

#### Windows Application via URL Protocol

```json
  "externalLinks": [
    {
      "url": "gclaunch://action=PropertyGov&open=true&fid=[identifiers]&rnd=1611116478",
      "label": "Open in Property.Gov",
      "propertyName": "Property Number",
      "localDataSource": true
    }
  ],
```
