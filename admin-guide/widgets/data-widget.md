---
title: Data Widget
icon: list-unordered
---

:::note Under Construction

*This page is a work in progress. Please refer to our existing Help Guide for information about this topic.*

[Existing Help Guide](https://help.pozi.com/search?query=widgets)

:::

*Available for Pozi Pro, Enterprise and Enterprise Cloud customers*

The Pozi data widget enables users to search any address to display specific details about the location (eg, waste collection details).

==- Example data widget

*Type '3 Queen Street' to try it out.*

<iframe height="300px" width="100%" overflow="hidden" frameBorder="0" src="https://southerngrampians.pozi.com/widget.html#card=Waste%20Collection&fieldnames=Next Rubbish Pickup,Next Recycling Pickup,Next Organics Pickup&fontsize=20"></iframe>

---

Embed code:

```
<iframe height="300px" width="100%" overflow="hidden" frameBorder="0" src="https://southerngrampians.pozi.com/widget.html#card=Waste%20Collection&fieldnames=Next Rubbish Pickup,Next Recycling Pickup,Next Organics Pickup&fontsize=20"></iframe>
```

==-

## Configuration

Two configuration options exist for data widgets:

* **Standard** (typical): for any result that appears in the *What's Here* section in the Info Panel of the Pozi map app
* **CKAN**: for any dataset is published as a WFS on data.gov.au (and which doesn't appear in the *What's Here* section)

+++ Standard

Any result that appears in the *What's Here* section in the Info Panel of your site can be exposed in a Pozi data widget. All you need is the name of the dataset (as displayed in the relevant tab heading).

`https://` + `site` + `/#card=` + `dataset` + `&widget=true`

Example:

* site: `strathbogie.pozi.com`
* dataset: `rubbishcollection` (derived from the "Rubbish Collection" tab heading in the *What's Here* results, with any spaces or underscores removed)

The basic widget URL is constructed as follows:

`https://` + `strathbogie.pozi.com` + `/#card=` + `rubbishcollection` + `&widget=true`

Widget URL: https://strathbogie.pozi.com/#card=rubbishcollection&widget=true

The resulting widget displays a table view of the results for the address specified by the user. See the Options section below for customising the results.

+++ CKAN

Any dataset that is published as a data.gov.au WFS service can be configured as a data widget, regardless of whether is appears in the map app's What's Here section.

`https://` + `site` + `/#ckan=` + `ckan id` + `&widget=true`

#### Obtaining the CKAN id

|Step|Description|Example|
|---|---|---|
|1.|obtain the dataset's page on data.gov.au|`https://data.gov.au/dataset/ds-dga-f5d810f3-9b62-43c9-9a4e-e3afda01fe62/details?q=`|
|2.|isolate the dataset id|`ds-dga-f5d810f3-9b62-43c9-9a4e-e3afda01fe62`|
|3.|replace existing prefix with ckan prefix|`ckan_f5d810f3-9b62-43c9-9a4e-e3afda01fe62`|

The final URL will look like this:

`https://northerngrampians.pozi.com/#ckan=ckan_f5d810f3_9b62_43c9_9a4e_e3afda01fe62&widget=true`

The results from the data.gov.au API will not have any data transformers applied. If you require any data manipulation (such as waste collection calculations), you can specify them a parameters in the widget URL. See Data Transformer details below.

+++

## Options

### Display Specific Fields

By default, the data widget displays all fields as a table. If you want to instead see a list of fields, you can specify the field names within the `&fieldnames=...` parameter, separated by commas.

Example:

```
https://southerngrampians.pozi.com/widget.html#card=Waste Collection&fieldnames=Next Rubbish Pickup,Next Recycling Pickup,Next Organics Pickup
```

### Hide Field Names

This parameter hides the field names and only displays the field data.

`fieldnameshide=true`

### Font Size

By default the font size of the widget text is set to 18. However, you can specify a different font size by using the optional font size parameter, for example:

`fontsize=10`

### Data Transformer

If using the standard (not CKAN) configuration option, any transformers are already applied within the Pozi app, so there is typically no need to configure any transformer in the widget URL.

However, if using the CKAN option, the results will not have any transformers applied, and so you can specify them here in the widget URL.

`transformer=garbage`

## Troubleshooting

==- Some fields are not showing in the results

If the widget URL specifies field names to display via `fieldnames=...`, these fields must exist in the source data.

If expected attributes are not showing, check that the field names in the source data have not changed. If they have changed, update the widget URL accordingly.

==-
