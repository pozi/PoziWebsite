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

## Miscellenous

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
