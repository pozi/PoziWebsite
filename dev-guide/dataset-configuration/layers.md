---
---

# Layers

* `"title":` use plural name where practical
* `"group":` the name of the layer group in which the layer will appear in the layer panel

## Basic GeoJSON Layer

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

## Options

### Queryable

Control whether the features in this layer are queryable/selectable by the user clicking in the map.

```json
  "queryable": true,
```

### Opacity

```json
  "opacity": 0.7,
```

### Metadata

```json
  "about": {
    "source": "National Public Toilet Map",
    "organisation": "Australian Department of Health",
    "url": "https://data.gov.au/dataset/ds-dga-553b3049-2b8b-46a2-95e6-640d7986a8c1"
  },
```

### Zoom Levels

```json
  "minZoom": 16,
  "maxResolution": 4
```

### Include Fields

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

### Exclude Fields

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

### Transformers

#### Rename and Order Fields

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

### Promote Details

Display the feature's attributes (which would normally be displayed in the Details panel of the child record) directly in within the parent, taking the place of the child title.

```json
  "promoteDetails": true
```

Only to be used when there is no requirement to view Location/Dimensions, Source or any child records.
