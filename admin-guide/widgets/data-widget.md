---
icon: list-unordered
---

# Data Widget

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

Any result that appears in the *What's Here* section in the Info Panel of your site can be exposed in a Pozi data widget. All you need is the name of the dataset (as displayed in the relevant tab heading).

`https://` + `site` + `/#/card[` + `dataset` + `]/widget[true]/`

Example:

* site: `strathbogie.pozi.com`
* dataset: `wastecollection` (derived from the "Waste Collection" tab heading in the *What's Here* results, with any spaces or underscores removed)

The basic widget URL is constructed as follows:

`https://` + `strathbogie.pozi.com` + `/#/card[` + `wastecollection` + `]/widget[true]/`

Widget URL: https://strathbogie.pozi.com/#/card[wastecollection]/widget[true]/

The resulting widget displays a table view of the results for the address specified by the user. See the Options section below for customising the results.

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

## Troubleshooting

==- Some fields are not showing in the results

If the widget URL specifies field names to display via `fieldnames=...`, these fields must exist in the source data.

If expected attributes are not showing, check that the field names in the source data have not changed. If they have changed, update the widget URL accordingly.

==-
