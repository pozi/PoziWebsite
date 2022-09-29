---
layout: page
description: We strive to continually improve Pozi's capabilities. See what's new, improved and fixed in Pozi.
---

# Roadmap

<img src="/static/img/undraw/undraw_scrum_board_re_wk7v.svg" alt="" style="float:right;width:300px;margin:40px 40px;">

We're constantly working to improve the Pozi experience for our users based on the feedback and feature requests we receive from our clients. This includes developing new functionality, fixing bugs, improving the interface, and optimising performance.

We also offer clients the opportunity to sponsor development of new features, giving them direct input into the specification to ensure it meets their exact requirements.

[!button icon="comment" corners="pill" text="Tell us what you want to see in Pozi!"](/contact/)

<br/>

## Upcoming

- [ ] improve Azure Active Directory integration
- [ ] don't unhighlight parent object when clicking on a non-spatial child record
- [ ] obtain layer title/label field setting from QGIS Server
- [ ] prevent Share links from capturing the panel state (unless specified in advanced options)

## Completed

### September 2022

- [x] new: use layer opacity setting from QGIS Server
- [x] new: enable layer catalogues to be filtered to include/exclude layers
- [x] new: use field name aliases from QGIS project
- [x] improved: overhaul analytics capture using new Google Analytics GA4 (in preparation for monthly reports for clients)
- [x] fixed: display clickable link in What's Here results when the selected layer's title attribute is a URL
- [x] fixed: allow for differences in upper/lower case in layer's specified ID field

### August 2022

- [x] new: enable administrators to configure child datasets within QGIS
- [x] new: display legend inline for switched-on layers
- [x] new: enable loading of layers via WMTS catalogue
- [x] improved: increase precision on measurement tools
- [x] improved: enable more overrides for entire catalogue layers, such as opacity
- [x] improved: after layer search, expand only groups that contain selected layer
- [x] improved: unify appearance of layer options for stand-alone and catalogue layers
- [x] improved: hide table when layer is turned off
- [x] improved: render null and undefined values as empty string in table view
- [x] improved: use favicons from alternative URLs for frequently used links which don't have their own favicon
- [x] fixed: better remember state of expanded layer groups for sites with a lot of layers
- [x] fixed: respect field order of source data in QGIS GetFeature queries
- [x] fixed: horizontal alignment of links in info panel

### July 2022

- [x] new: obtain layer queryability setting from QGIS Server
- [x] new: enable highlighting of selected features from QGIS Server layers
- [x] improved: faster app loads by batch loading layers
- [x] improved: faster app loads for return visitors by caching layer catalogue in the browser (via service workers)
- [x] improved: enable layer filter to narrow down results within nested layer groups
- [x] improved: slimmer left drawer takes up less screen real estate
- [x] improved: show spinner during app load if waiting for slow data sources
- [x] improved: even better evaluation of attributes to display for title of selected feature
- [x] improved: layer panel now responds much quicker to layer reset and expanding large groups
- [x] fixed: info panel failed to show feature details after initial viewing
- [x] fixed: wait for local datasource check before attempting to get local layers
- [x] fixed: table view now working for catalogue layers

### June 2022

Our biggest release in over two years!

- [x] new: **QGIS integration**
  * import layer catalogue from QGIS Server and other WMS/WFS sources
  * build nested layer groups from WMS/QGIS catalogues
  * create Admin Guide, add content for using QGIS to create and maintain layer catalogues
- [x] new: dynamically evaluate the most suitable attribute from any selected feature to display as feature's title
- [x] new: display loading spinner for WMS layers
- [x] improved: compact layer view
- [x] improved: extend table view to full page width
- [x] upgrade to React v17
- [x] fixed: prevent page from reloading on first visit

---

!!!

Please excuse the gaps in our timeline!

Sometimes we get busy building, and we forget to celebrate our wins and record our accomplishments.

We'll do a better job going forward keeping track of all new development and improvements!

<!-- TO-DO: add to timeline from https://github.com/pozi/PoziApp/commits/ -->
<!-- https://github.com/pozi/PoziApp/pulls?q=is%3Apr+sort%3Aupdated-desc+is%3Aclosed -->

!!!

---

### March 2022

- [x] new: support for vector tile basemaps

### January 2022

- [x] new: display coordinates in alternative projections
- [x] improved: enable tolerance of WMS GetFeatureInfo clicks for QGIS Server

---

### December 2021

- [x] fixed: generate valid Esri geometries on selected features to enable better integration with ArcGIS Online

### November 2021

- [x] improved: filter address search results by municipality

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
