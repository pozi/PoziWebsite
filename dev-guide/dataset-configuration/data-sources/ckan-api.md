---
---

# CKAN API

Any CSV data published to data.gov.au is automatically exposed through its CKAN API. The API accepts SQL requests and returns data in a JSON format (not GeoJSON).

When configuring in Pozi, use `"loader": "ckanapi"` to instruct Pozi to convert the results to GeoJSON. If the data contains fields named `x`, `y`, `longitude`, `lng`, `lon`, `long`, `latitude` or `lat`, these are used to generate point geometries in the GeoJSON. Otherwise the geometry is null.

Example request: https://data.gov.au/api/action/datastore_search_sql?sql=SELECT%20*%20from%20%22306f9e0d-581a-4506-8de9-20283f4334a1%22

## Settings

### Allowed Functions

https://github.com/ckan/ckan/blob/master/ckanext/datastore/allowed_functions.txt

As of February 2022, data.gov.au removed support for `CAST()`. Instead, use the `::` syntax for doing type conversions.

```
https://data.gov.au/api/action/datastore_search_sql?sql=select * from "34076296-6692-4e30-b627-67b7c4eb1027" where "Latitude" :: float > -37.07 and "Latitude" :: float < -36.39 and "Longitude" :: float > 144.03 and "Longitude" :: float < 144.86
```

## Examples

==- GeoJSON layer


```json
{
  "title": "Public Toilets",
  "group": "Council Facilities and Services",
  "type": "GeoJSON",
  "about": {
    "source": "National Public Toilet Map",
    "organisation": "Australian Department of Health",
    "url": "https://data.gov.au/dataset/ds-dga-553b3049-2b8b-46a2-95e6-640d7986a8c1"
  },
  "style": {
    "src": "img/map-icons/white/png-28x28/toilet1.png",
    "bubbleBackground": "#1E90FF"
  },
  "config": {
    "spatial": {
      "loader": "ckanapi",
      "url": "https://data.gov.au/api/action/datastore_search_sql?sql=select * from \"100da45f-6d1d-40ad-8c47-5a0481f1fbf9\" where \"Latitude\" > -37.07 and \"Latitude\" < -36.39 and \"Longitude\" > 144.03 and \"Longitude\" < 144.86",
      "label": "Name",
      "id": "_id"
    }
  }
}
```

==- Non-spatial table lookup

Uses `WARD_NUM` from parent record to do a lookup.

```json
{
  "title": "Councillors",
  "type": "GeoJSON",
  "parent": "Ward and Councillors",
  "showInLayerControl": false,
  "about": {
    "organisation": "City of Bendigo",
    "url": "https://data.gov.au/dataset/ds-dga-7fe44b6d-774e-4888-ba0f-a80cbfdba01c"
  },
  "config": {
    "spatial": {
      "loader": "ckanapi",
      "url": "https://data.gov.au/api/action/datastore_search_sql?sql=SELECT * from \"5560bff7-0f03-4f9b-a2aa-e77898bd3d46\" WHERE \"ward_id\"  IN ('[WARD_NUM]')",
      "id": "ID",
      "label": "name"
    }
  }
}
```

==-
