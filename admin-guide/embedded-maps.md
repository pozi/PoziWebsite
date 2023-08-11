---
icon: apps
---

# Embedded Maps

The Pozi web map can be embedded into any web page to enable your customers discover location-specific information about their place of interest from directly in your organisation's website.

* map display, default view or centred on any location
* autocomplete address search
* inline info panel displays location-specific information for selected features
* nearby facilities and services, including navigation options for walking, cycling and driving
* print to PDF
* and more

## How to Embed

Pozi maps are embedded using a standard HTML iframe. Copy the link of the desired map from your browser's address bar or by clicking the Share button in the Tools panel. If you want the page to show the default map extent, you can strip out the location parameters (eg `x[144.44500]/y[-36.73075]/z[10]/`). Then wrap the link in an `iframe` tag.

```
<iframe width="100%" height="500px" frameborder="0" scrolling="no" allow="fullscreen" src="https://bendigo.pozi.com/"></iframe>
```

This is the resulting map from the above HTML:

<iframe width="100%" height="500px" frameborder="0" scrolling="no" allow="fullscreen" src="https://bendigo.pozi.com/"></iframe>

</br>

Insert the HTML in any webpage or CMS that supports iframes.

</br>

## Examples

[!ref icon="/static/img/client-logos/frankston.png" text="Frankston City Council - My Address"](https://www.frankston.vic.gov.au/My-Property/My-Address-property-information-and-whats-in-your-area/)
