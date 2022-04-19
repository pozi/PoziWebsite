---
title: Enquire
sidebar_position: 3
---

:::note Under Construction

*This page is a work in progress. Please refer to our existing Help Guide for information about this topic.*

[Existing Help Guide](https://help.pozi.com/search?query=enquire)

:::

---

To discover information about any location on the map, simply click on the map or do a search. Information about the location or selected feature is displayed in Pozi's *Info Panel*.

## What's Here

When enquiring on a location via clicking on the map or doing a search, Pozi displays information from a variety of data sources that are relevant to the location. This enquiry mode is called *What's Here*.

## Feature Selection

Many layers in Pozi are interactive, and allow users to select individual features to directly query them.

When the cursor is hovered over these features, the cursor changes to a pointing hand. Click to select the feature and view its attribute information in the Info Panel.

## Details and Related Information

Pozi can display not only information about features on the map, but also related information from separate sources.

Pozi uses parent-child relationships between datasets to provide unlimited querying capabilities.

![](./img/info-panel-parent-and-child-records.png){style="width:400px"}

The parent record contains various attributes, such as the ones that are visible in the Details panel, other hidden attributes, and also the record's geometry. Any of these can be used as a key for querying other datasets. And any child record can become a parent of another dataset, and so on.

In the above example:

* `Property Information` is queried using the parent record's property number
* `Property Parcels` is queried using the parent record's property pfi
* `Property Planning Overlays` and `Zones` both use the parent record's geometry (ie, property boundary) in a spatial intersection query
