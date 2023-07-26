---
icon: sign-in
---

# Link In

The Pozi link-in enables other applications to launch Pozi and zoom to specific locations on the map.

This page outlines the URL parameters to launch a Pozi map to dynamically customise the map's location and display.

The URL parameters can be manually or programmatically constructed, or you can simply copy the URL of your Pozi session to capture and share its current state.

### Location by Coordinates

The Pozi map will display centred at a specific location and zoom level.

https://frankston.pozi.com/#/x[145.12617]/y[-38.14357]/z[17]/

### Layer Display

Pozi will display the specified layer. Specify the layer name in lower case and with any spaces or underscores removed.

https://shepparton.pozi.com/#/layers[wastecollectionzones]/

### What's Here

Pozi will display the Info Panel results for the target point location or region.

#### Point Location

https://gleneira.pozi.com/#/x[145.05178]/y[-37.90975]/z[18]/feature[whatshere,POINT(145.05178%20-37.90975)]/

#### Region

https://strathbogie.pozi.com/#/x[145.56842]/y[-36.75206]/z[19]/feature[whatshere,POLYGON((145.56777%20-36.75196%2C145.568832%20-36.75147%2C145.56863%20-36.75224%2C145.56777%20-36.75196))]/

### Feature Selection

Given a layer name and feature id, Pozi will highlight the feature and display its info results.

https://latrobe.pozi.com/#/layers[skateparks]/feature[skateparks,4]/

If the feature location is known (for example, if you have coordinates in addition to the feature id), specify the coordinates and a suitable zoom level.

https://latrobe.pozi.com/#/x[146.40171]/y[-38.23845]/z[18]/layers[skateparks]/feature[skateparks,4]/

### Layer Filter

https://northerngrampians.pozi.com/#/filter[assets]/tab[layers]/

### Panel Focus

https://bendigo.pozi.com/#/tab[layers]/

### Location by Property Identifier

Pozi will zoom to a specific property and display info results for the location based on a property number.

https://northerngrampians.pozi.com/?propnum=1038143

Note:

* available for Victorian property numbers maintained in `prop_propnum` field in Vicmap Property
* available for Pozi Pro, Enterprise and Enterprise Cloud plans
