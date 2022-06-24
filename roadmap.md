---
visibility: hidden
---

# Roadmap

We are constantly improving the Pozi experience for our users based on the feedback we receive from our clients. This includes developing new features, fixing bugs, improving the interface and optimising performance.

We also offer clients the opportunity to sponsor development of new features, giving them direct input into the specification to ensure it meets their exact requirements.

[!button icon="mention" corners="pill" text="Tell us what you want to see in Pozi!"](/contact/)

<br/>

## Upcoming

### Features and Enhancements

- [ ] enable layer finder on catalogue layers
- [ ] allow linked layer to be turned off independently from target layer

### Bugfixes

==- Known bugs

- [ ] WMS GetFeatureInfo details fail to display after initial viewing
- [ ] table view for catalogue layers does not persist on page
- [ ] layer groups don't remember their expand/collapse status from previous session

==-

Found a bug not listed here? Please send us details at support@pozi.com.

<br/>

## Completed
### June 2022

- [x] new: **QGIS integration!**
  * import layer catalogue from QGIS Server and other WMS/WFS sources
  * build nested layer groups from WMS/QGIS catalogues
  * cache layer catalogues in browser for sites with intermittent network performance issues
  * create Admin Guide
- [x] new: dynamically evaluate suitable title to display for selected features
- [x] new: display loading spinner for WMS layers
- [x] improved: compact layer view
- [x] improved: extend table view to full page width
- [x] upgrade to React v17

---

!!!

Please excuse the gaps in our timeline! Sometimes we get busy building, and don't spend enough time celebrating our wins and recording our accomplishments. Come back soon to see a more complete timeline.

TO-DO: add to timeline from https://github.com/pozi/PoziApp/commits/

!!!

---

### July 2021

- [x] removed: support for Internet Explorer

---

### July 2019

- [x] new: export map as georeferenced image (.png + .pngw worldfile)

### June 2019

- [x] new: user map annotations
- [x] new: print options - A4, A3, Landscape, Portrait

### May 2019

- [x] new: full-screen function
- [x] improved: layer control now remembers its last scroll position

---

### April 2018

- [x] new: Jotform support
- [x] new: GeoServer authentication
- [x] fixed: support encoded URLs for better cross-application support
- [x] improved: new notification about limited compatibility on older mobile operating systems

---
### December 2017

- [x] improved: nicer aerial photo button
- [x] improved: when user turns off a WMS layer, deselect any selected features from that layer
- [x] fixed: cleared old cookies to prevent Firefox reporting "weak encryption"
- [x] fixed: changed GeoServer API requests to be compatible with new GeoServer
- [x] fixed: hide search options for private layers when user is public
- [x] fixed: interpretation of WMS result coordinates by Internet Explorer
- [x] fixed: un-highlight selected feature when user closes drawer

### November 2017

- [x] new: Mapzen address search option
- [x] improved: custom info symbol in menu
- [x] fixed: tickboxes in layer panel weren't on when opening layer panel on load
- [x] fixed: feature highlight disappeared when using measuring tool

### October 2017

- [x] new: new search functionality for GeoJSON layers and various APIs
- [x] improved: autocomplete search now allows user to hit Enter to accept
- [x] fixed: search option radio buttons in IE failed to display
