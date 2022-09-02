---
sidebar_position: 3
icon: location
---

# Enquire

To discover information about any location on the map, click on the map or use the search tool to find your location.

The Pozi *Info Panel* displays Details about the location or selected feature.

## What's Here

When enquiring on a location via clicking on the map or doing a search, Pozi displays information from a variety of data sources that are relevant to the location. This enquiry mode is called *What's Here*.

### Simple Selection

Simple selections are triggered by any of the following events:

* a single click on the map
* using the search function
* opening Pozi using a link that specifies a target location or feature id
  * example: `https://westwimmera.pozi.com/?propnum=1018753`

### Multi Selection

In addition to enquiring on single locations, Pozi enables you to enquire on regions and multiple locations.

#### Regions

To enquire on a region:

* click Tools > Select > Select by region
* click on the map to start drawing
* click on map locations to define the boundary of the enquiry region
* double-click to finish

Tip: to enquire on a *path* (for example, to select all the properties along a pipeline or other linear feature), use the region tool to draw a narrow region that approximates the path.


## Feature Selection

Any map layers that are configured from a *vector* data source are directly interactive, allowing you to select individual features on the map to view its details.

When the cursor hovers over these features, the cursor changes to a pointing hand. Click to select the feature and view its attribute information in the Info Panel.

## Details and Related Information

Pozi displays information not only about features selected from the map, but also any related information from separate sources.

Pozi uses parent-child relationships between datasets to provide unlimited querying capabilities.

![](./img/info-panel-parent-and-child-records.png){style="width:400px"}

### Download Related Information

When related datasets have been configured for downloading, Pozi enables you to retrieve and download related information.

If your target selection includes more than one feature (typically by doing a [multi selection](#multi-selection)), Pozi will display download options for permitted datasets that are related to the selected features. A common use case for internal users is retrieving property owner details for selected properties.

Click the link to download a CSV file of the related features.
