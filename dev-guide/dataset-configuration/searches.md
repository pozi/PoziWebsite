---
---

# Searches

By default, Pozi enables users to select from any available vector layer and search across all fields for matching records. However, for larger datasets such as properties and addresses, it is often not practical to load an entire dataset into the browser to search in this way.

Instead, custom search options can be configured to query a server to fetch results that match the user's search criteria.

Custom searches appear *above* the default vector layer search options.

## WFS Servers

Any server that supports WFS and returns GeoJSON can be configured as a search endpoint.

==- QGIS Server Example (EXP_FILTER)

```json
{
  "title": "DCDB Assessment Number",
  "type": "Search",
  "showInLayerControl": false,
  "localDataSource": true,
  "search": {
    "id": "assessment",
    "enabled": true
  },
  "config": {
    "spatial": {
      "url": "https://poziserver-grcqldgovau.msappproxy.net/pozi/qgisserver?MAP=E:/application/pozi/projects/general.qgz&TYPENAME=DCDB&LAYERS=DCDB&STYLES=default&SERVICE=WFS&REQUEST=GetFeature&VERSION=1.1.0&SRSNAME=EPSG:4326&OUTPUTFORMAT=application/json&EXP_FILTER=assessment ilike '(searchquery)%25'&maxfeatures=100"
    }
  }
}
```

==- QGIS Server Example (OGC Filter)

Note: QGIS Server (as at v3.28) seems to *not* properly support wildcard searches in the OGC filter. Regardless, the configuration in this example includes wildcard settings to provide forward compatibility for future versions when wildcard searches are supported.

```json
{
  "title": "DCDB Assessment Number",
  "type": "Search",
  "showInLayerControl": false,
  "localDataSource": true,
  "search": {
    "id": "assessment",
    "enabled": true
  },
  "config": {
    "spatial": {
      "url": "https://poziserver-grcqldgovau.msappproxy.net/pozi/qgisserver?MAP=E:/application/pozi/projects/general.qgz&TYPENAME=DCDB&LAYERS=DCDB&STYLES=default&SERVICE=WFS&REQUEST=GetFeature&VERSION=1.1.0&SRSNAME=EPSG:4326&OUTPUTFORMAT=application/json&FILTER=<Filter><PropertyIsLike wildCard=\"*\" singleChar=\".\" escape=\"!\"><PropertyName>assessment</PropertyName><Literal>(searchquery)</Literal></PropertyIsLike></Filter>",
      "label": "assessment"
    }
  }
}
```

==- Victoria Open Data Platform Example (GeoServer)

```json
{
  "title": "Property Number",
  "type": "Search",
  "showInLayerControl": false,
  "search": {
    "id": "propnum",
    "enabled": true
  },
  "config": {
    "spatial": {
      "url": "https://opendata.maps.vic.gov.au/geoserver/ows?SERVICE=WFS&VERSION=1.1.0&REQUEST=GetFeature&srsName=EPSG%3A4326&typeNames=v_property_mp&maxFeatures=1&outputFormat=application%2Fjson&cql_filter=propv_graphic_type='P' and prop_lga_code='325' and prop_propnum='(searchquery)'",
      "label": "prop_propnum",
      "id": "$id"
    }
  }
}
```

==- Queensland Globe Example (ArcGIS)

```json
{
  "title": "Lot/Plan",
  "type": "Search",
  "showInLayerControl": false,
  "search": {
    "id": "lotplan",
    "enabled": true
  },
  "config": {
    "spatial": {
      "url": "https://spatial-gis.information.qld.gov.au/arcgis/rest/services/PlanningCadastre/LandParcelPropertyFramework/MapServer/4/query?f=geojson&outFields=*&returnGeometry=true&inSR=4326&where=lotplan=upper('(searchquery)')",
      "label": "lotplan",
      "id": "$id"
    }
  }
}
```

==-

## Geocoding Services

Address searches can be more challenging than standard searches. Commercial geocoding services can be a good choice for providing address searches because of the options they offer including fuzzy search, filter by administrative boundary, updates from OpenStreetMap, and more.

### Geocode Earth

#### Filter by Municipality

Geocode Earth offers a filter that can restrict the address results to a specific municipality.

https://geocode.earth/docs/forward/customization/#restrict-results-by-parent-id

Loddon search:

* [Before - using bounding box](https://api.geocode.earth/v1/autocomplete?text=3%20albert&layers=address,street&boundary.rect.min_lat=-36.91&boundary.rect.min_lon=143.31&boundary.rect.max_lat=-35.91&boundary.rect.max_lon=144.35&api_key=xxxx) - 5 results, including 3 from neighbouring council
* [After - using "county" filter](https://api.geocode.earth/v1/autocomplete?text=3%20albert&layers=address,street&boundary.gid=whosonfirst:county:102049477&api_key=xxxx) - 2 results

In the Geocode Earth configuration, the municipality is called `county`.

For municipal client site:

* do a search for an address within the municipality and obtain `county_gid` value from the console (eg, whosonfirst:county:102049477)
* update Geocode Earth search config to replace bounding box parameters with `boundary.gid=` parameter
* check results

==- Example

```json
{
  "title": "Address Search",
  "type": "Search",
  "showInLayerControl": false,
  "search": {
    "enabled": true,
    "id": "address",
    "autocomplete": true,
    "type": "mapzen"
  },
  "config": {
    "spatial": {
      "url": "https://api.geocode.earth/v1/autocomplete?text=(searchquery)&layers=address,street&boundary.gid=whosonfirst:county:102049053&api_key=xxxx"
    }
  }
}
```

==- 

#### Filter by Bounding Coordinates

==- Example

```json
{
  "title": "Address",
  "group": "",
  "type": "Search",
  "showInLayerControl": false,
  "search": {
    "enabled": true,
    "id": "address",
    "autocomplete": true,
    "type": "mapzen",
    "bbox": [
      [
        145.13,
        -37.92
      ],
      [
        145.26,
        -38.09
      ]
    ]
  },
  "config": {
    "spatial": {
      "url": "https://api.geocode.earth/v1/autocomplete?text=(searchquery)&layers=address,street&boundary.rect.min_lat=[min_lat]&boundary.rect.min_lon=[min_lon]&boundary.rect.max_lat=[max_lat]&boundary.rect.max_lon=[max_lon]&api_key=ge-39bfbedc55be11c0"
    }
  }
}
```

==-

### HERE

#### Search by Address

==- Example

```json
{
  "title": "Address",
  "group": "",
  "type": "Search",
  "showInLayerControl": false,
  "search": {
    "id": "address",
    "type": "here",
    "titlecase": true,
    "bbox": [
      [
        145.36,
        -37.86
      ],
      [
        145.78,
        -38.34
      ]
    ],
    "enabled": true
  },
  "config": {
    "spatial": {
      "url": "https://geocoder.cit.api.here.com/6.2/search.json?gen=9&app_id=pYZXmzEqjmR2DG66DRIr&app_code=T-Z-VT6e6I7IXGuqBfF_vQ&country=AUS&state=VIC&&searchtext=(searchquery)&bbox=[bboxhereformat]",
      "id": "$id"
    }
  }
}
```

==-

#### Search by Coordinates

https://southerngrampians.pozi.com/#/tab[search]/

The HERE geocoder can be used to return results based on coordinates. For instance, a user can type `142.026 -37.541` into the standard HERE geocoder box to navigate to the desired location.

A separate search option can be configured in Pozi as its own search option to present the user with an intuitive option and provide example coordinates in the expected format.

==- Example

```json
{
  "title": "Coordinates",
  "group": "",
  "type": "Search",
  "enabled": true,
  "showInLayerControl": false,
  "search": {
    "enabled": true,
    "bbox": [
      [
        141.43,
        -37.088
      ],
      [
        142.62,
        -37.97
      ]
    ],
    "type": "here",
    "caption": "Example: 142.026 -37.541"
  },
  "config": {
    "spatial": {
      "url": "https://geocoder.cit.api.here.com/6.2/search.json?gen=9&app_id=pYZXmzEqjmR2DG66DRIr&app_code=T-Z-VT6e6I7IXGuqBfF_vQ&country=AUS&state=VIC&&searchtext=(searchquery)&bbox=[bboxhereformat]",
      "id": "$id"
    }
  },
  "_key": "layer-60"
}
```

==-

### Mapshare

==- Example

```json
{
  "title": "Address",
  "type": "Search",
  "showInLayerControl": false,
  "search": {
    "enabled": true,
    "autocomplete": true,
    "fullText": true,
    "bbox": [
      [
        145.034,
        -37.924
      ],
      [
        145.156,
        -38.085
      ]
    ],
    "id": "address",
    "type": "mapshare"
  },
  "config": {
    "spatial": {
      "url": "https://corp-geo.mapshare.vic.gov.au/arcgis/rest/services/Geocoder/VMAddressEZIAdd/GeocodeServer/suggest?searchExtent=[min_lon],[max_lat],[max_lon],[min_lat]&location=[mapX],[mapY]&text=(searchquery)&f=json&maxSuggestions=15",
      "forwardSearchUrl": "https://corp-geo.mapshare.vic.gov.au/arcgis/rest/services/Geocoder/VMAddressEZIAdd/GeocodeServer/findAddressCandidates?&magicKey=[magicKey]&SingleLine=[text]&f=json",
      "id": "$id"
    }
  }
}
```

==-
