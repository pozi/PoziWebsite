---
icon: sign-in
---

# Link In

The Pozi link-in enables other applications to launch Pozi and zoom to specific locations on the map.

This page outlines the URL parameters to launch a Pozi map to dynamically customise the map's location and display.

The URL parameters can be manually or programmatically constructed, or you can simply copy the URL of your Pozi session to capture and share its current state.

### Location by Coordinates

The Pozi map will display at a specific location and zoom level

https://frankston.pozi.com/#/x[145.12617]/y[-38.14357]/z[17]/

### Location Info

Pozi will display the Info Panel results for the target location or region.

https://gleneira.pozi.com/#/x[145.05178]/y[-37.90975]/z[18]/feature[whatshere,POINT(145.05178%20-37.90975)]/tab[info]/

### Location Info for Region

https://strathbogie.pozi.com/#/x[145.56842]/y[-36.75206]/z[19]/feature[whatshere,POLYGON((145.56777%20-36.75196%2C145.568832%20-36.75147%2C145.56863%20-36.75224%2C145.56777%20-36.75196))]/tab[info]/

### Feature Selection

Pozi will display the Info Panel results for the specified feature. Use in conjunction with Location (above) to ensure the feature is visible in the map.

https://latrobe.pozi.com/#/x[146.40171]/y[-38.23845]/z[18]/feature[skateparks,4]/layers[skateparks]/tab[info]/

### Layer Display

https://shepparton.pozi.com/#/layers[wastecollectionzones]/

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
