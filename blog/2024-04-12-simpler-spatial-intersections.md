---
slug: simpler-spatial-intersections
author: Simon O'Keefe
tags:
description:
category:
visibility:
---

# Simpler configuration of datasets for spatial intersections

We've recently improved to Pozi to easier for administrators to enable layers to be used in spatial intersection queries. With one single configuration option in QGIS, you can now enable any layer in Pozi to be triggered by any other layer so that users can see related information based on overlapping features between the layers.

## Background

We simplified this configuration in response to helping a client migrate from their existing GIS system to Pozi. Although Pozi excels at performing spatial intersections on selected features, the sheer number of layers that the client wanted to configure for this purpose made us rethink how to improve the setup.

We've now updated Pozi to easily enable standard layers to be used as *child datasets* for spatial intersections.

![Parent and child records](../admin-guide/qgis/img/info-panel-parent-and-child-records.png){style="width:400px"}

## What are child datasets?

[Child datasets](../admin-guide/qgis/configuring-linked-datasets/) are an invaluable part of the Pozi experience. They enable users to easily view information that's related to selected map features. Examples include:

- select a property to view owner details
- select an asset to view maintenance history
- select a ward to view councillor details

In these non-spatial examples, the *id* of the selected map feature (the parent) is used to look up information from a different source (the child) that matches the id value.

Alternatively, *spatial* child datasets can use the parent feature's *geometry* (instead of an id) to do a spatial query to return records whose features intersect with the parent feature. Examples include:

- select a property to view intersecting planning zones
- select an asset to view what work crew is responsible for it
- select a park to view all trees within it

## Configuration

Pozi now automatically generates a spatial intersection query for child datasets in the absence of any other filter. Pozi now assumes that any child dataset that doesn't have a filter specified will use a *spatial* relationship, specifically an *intersection*.

The configuration of a child dataset to use a spatial intersection is now as simple as specifying the parent layer in the child layer's QGIS Server *keyword*. For example:

![Keyword for Spatial Intersection](../admin-guide/qgis/img/qgis-server-keyword-for-spatial-intersection.png){style="width:600px"}

With the parent specified and no other filter, Pozi automatically generates a spatial intersection query on the child dataset whenever the user selects a feature from the parent layer. The info panel displays any child features that intersect with the selected parent.

## Use a dataset as a layer *and* a child dataset

Previously, if you wanted a layer to be available as a standard layer and also as a child result of another layer, you needed to configure the dataset twice in QGIS.

Now, a standard layer can also be used as a child dataset if you specify just the `parent` keyword and no other filter. Pozi will assume that the parent/child relationship is a spatial relationship, and so no filter is needed.

This means you only need to configure the dataset once in QGIS, and it can be used as a child dataset (if you specify a parent) as well as a standard vector layer.

### A note about large datasets

Remember that child datasets still need to be exposed as a vector layer (ie, enabled for WFS). Some larger datasets [may not be suitable](../admin-guide/qgis/configuring-layers/#disadvantages-of-vector-layers) for exposing as a vector layer because Pozi will load the entire dataset into the browser, and may suffer from performance issues if the dataset is large.

If you want to use a large dataset as a spatial child dataset but *not* expose it as a layer that users can load in its entirety, configure it with `showInLayerControl=false`. This will hide the layer from the layer panel (and thus preventing the user from loading the entire dataset) while still enabling the dataset to be used as a child dataset.

(Non-spatial child datasets are automatically hidden from the layer panel, so no additional configuration is required for the dataset to remain hidden.)

## Where to from here

This update is part of our plan to make datasets more flexible in what they can be used for. By dropping explicit filters in the configuration, we can start to use datasets for multiple purposes.

Over the coming months, we'll be adding controls for enabling datasets to be used as dedicated search endpoints. You'll also be able to use datasets both as WMS and WFS.

Stay tuned for further updates!
