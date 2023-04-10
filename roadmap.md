---
layout: page
description: We strive to continually improve Pozi's capabilities. See what's new, improved and fixed in Pozi.
---

# Roadmap

<img src="/static/img/undraw/undraw_scrum_board_re_wk7v.svg" alt="" style="float:right;width:300px;margin:40px 40px;">

We're constantly working to improve the Pozi experience for our users based on the feedback and feature requests we receive from our clients. This includes developing new functionality, fixing bugs, improving the interface, and optimising performance.

We also offer clients the opportunity to sponsor development of new features, giving them direct input into the specification to ensure it meets their exact requirements.

[!button icon="comment" corners="pill" text="Tell us what you want to see in Pozi!"](/contact/)

---

## Upcoming

### New Features

- [ ] Pozi Publisher - ultimate spatial data catalogue management
  - publish map layers to the public from QGIS projects
  - improve start-up performance by pre-generating map catalogues
  - tap into external data providers with minimal configuration
- [ ] monthly analytics reports
- [ ] fine-grained user permission control utilising Azure AD
- [ ] display tables of selected features
- [ ] interactive bulk spatial selection for ad-hoc layers
- [ ] collaborate map annotations
- [ ] alternative layer download format options - GeoJSON, SHP, KML, GeoPackage, CSV and other popular formats
- [ ] 3D view

### Enhancements

- [ ] dynamic loading of layer catalogues
  - improve start-up time
  - enable clients to add custom layers from external sources
- [ ] prevent Share links from including the panel state (unless specified in advanced options)
- [ ] zoom/pan to selected feature on Pozi launch if URL contains a selected feature
- [ ] display What's Here target on Pozi launch if URL contains a target

---

## Completed

### April 2023

#### Fixed

- [x] 🪲 fix waste collection next pickup calculation misreporting date as 'Today' instead of 'Tomorrow' in some circumstances

### March 2023

#### Improved

- [x] 👍 maintain existing feature highlight when clicking/hovering on a non-spatial child record
- [x] 👍 enable support for WMTS catalogues as basemaps
- [x] 👍 support for CORS-restricted catalogues by sending requests through a proxy
- [x] 👍 display a loading spinner while waiting for What's Here results
- [x] 👍 when displaying dimensions for features that are more than 1 ha and less than 10 sqkm, use area unit of ha instead of sqkm
- [x] 👍 add favicon for Conquest links
- [x] 👍 add favicon for Greenlight links

#### Fixed

- [x] 🪲 restore map to fullscreen after closing drawer on mobile
- [x] 🪲 Jotform forms were sometimes not shown on initial click
- [x] 🪲 'Select by Property PFI list (CSV)' function is now working again
- [x] 🪲 prevent WMTS basemap disappearing when layer refresh button is clicked

### February 2023

#### New

- [x] ⚡ fallback data sources: enable critical datasets to be configured a "fallback" source so that if one fails, Pozi will switch over to a secondary source

#### Improved

- [x] 👍 make user-drawn polygon and line selections more visually consistent with the point selection
- [x] 👍 persist user-drawn polygon and line selection on map until cleared
- [x] 👍 remove "Nearby" layer when What's Here results are cleared
- [x] 👍 hide Info panel from print/PDF output when there are no current results
- [x] 👍 upgrade to OpenLayers 7.2.2 and latest versions of GeoStyler libraries
- [x] 👍 improve Unified Search documentation

#### Fixed

- [x] 🪲 unticking a layer's tickbox while the layer finder was displaying only filtered results caused other layers to turn off

### January 2023

#### Improved

- [x] 👍 update HERE Map API to v2.1

### December 2022

#### New

- [x] ⚡ Azure Active Directory token-based authentication
  * more robust authentication process with more persistent login
  * support AD logins in Edge browser
  * support AD logins on iOS devices

#### Improved

- [x] 👍 enable fine zoom level control when using Shift-click zoom
- [x] 👍 improve load times and label appearance for QGIS Server WMS layers by changing default layer format from tiled to full image
- [x] 👍 enable URLs that use the Pozi Proxy to be cached by service workers
- [x] 👍 switch property endpoints for Victorian municipalities to DELWP's ArcGIS Online service for improved performance and reliability
- [x] 👍 add support for mixed-case field names in waste collection pickup date calculation

### November 2022

#### New

- [x] ⚡ print to scale
- [x] ⚡ obtain layer title/label field setting from QGIS Server
- [x] ⚡ grey out layer name when not visible at current zoom
- [x] ⚡ enable ArcGIS basemap integration

#### Improved

- [x] 👍 change behaviour of clicking on partially-ticked layer folder tickbox to turn OFF all layers
- [x] 👍 don't automatically display labels when there is a field called 'label'

#### Fixed

- [x] 🪲 change pinch-zoom to resize the map instead of the whole interface
- [x] 🪲 enable large queries when using Azure App Proxy
- [x] 🪲 restore routing functionality by updating MapQuest API setting
- [x] 🪲 fix report function for tables that have an attribute field called 'geometry'
- [x] 🪲 fix blank background in print

### October 2022

#### New

- [x] ⚡ add 'Select by line' selection mode
- [x] ⚡ add button to clear current selection
- [x] ⚡ add optional separate site title for internal users
- [x] ⚡ enable child datasets to be configured in QGIS projects

#### Improved

- [x] 👍 use field name aliases from QGIS project
- [x] 👍 sort exact matches in Unified Search by weighting
- [x] 👍 render HTML-formatted attributes as HTML
- [x] 👍 support categorised layer styles that are based on fields that have an alias
- [x] 👍 display nicer message when attempting to download dataset that contains zero records
- [x] 👍 remove StreetView animation when coming back from child data view

#### Fixed

- [x] 🪲 prevent layers that have been configured as non-queryable in QGIS from appearing in *What's Here* results
- [x] 🪲 don't collapse layer groups that contain layers that match the layer filter
- [x] 🪲 update layer filter to not exclude some valid results
- [x] 🪲 gracefully handle tables that have an attribute field called 'geometry'
- [x] 🪲 ensure table can display when some records may contain no attributes

### September 2022

#### New

- [x] ⚡ use layer opacity setting from QGIS Server
- [x] ⚡ enable layer catalogues to be filtered to include/exclude layers

#### Improved

- [x] 👍 overhaul analytics capture using new Google Analytics GA4 (in preparation for monthly reports for clients)

#### Fixed

- [x] 🪲 display clickable link in What's Here results when the selected layer's title attribute is a URL
- [x] 🪲 allow for differences in upper/lower case in layer's specified ID field

### August 2022

#### New

- [x] ⚡ enable administrators to configure child datasets within QGIS
- [x] ⚡ display legend inline for switched-on layers
- [x] ⚡ enable loading of layers via WMTS catalogue

#### Improved

- [x] 👍 increase precision on measurement tools
- [x] 👍 enable more overrides for entire catalogue layers, such as opacity
- [x] 👍 after layer search, expand only groups that contain selected layer
- [x] 👍 unify appearance of layer options for stand-alone and catalogue layers
- [x] 👍 hide table when layer is turned off
- [x] 👍 render null and undefined values as empty string in table view
- [x] 👍 use favicons from alternative URLs for frequently used links which don't have their own favicon
- [x] 👍 switch Vicmap Basemap to new XYZ tile service

#### Fixed

- [x] 🪲 better remember state of expanded layer groups for sites with a lot of layers
- [x] 🪲 respect field order of source data in QGIS GetFeature queries
- [x] 🪲 horizontal alignment of links in info panel
- [x] 🪲 vertical padding around vector legends
- [x] 🪲 some legend images were not displaying
- [x] 🪲 some bubble icons were not displaying
- [x] 🪲 some layer groups couldn't expand/collapse in some situations

### July 2022

#### New

- [x] ⚡ obtain layer queryability setting from QGIS Server
- [x] ⚡ enable highlighting of selected features from QGIS Server layers

#### Improved

- [x] 👍 faster app loads by batch loading layers
- [x] 👍 faster app loads for return visitors by caching layer catalogue in the browser (via service workers)
- [x] 👍 enable layer filter to narrow down results within nested layer groups
- [x] 👍 slimmer left drawer takes up less screen real estate
- [x] 👍 show spinner during app load if waiting for slow data sources
- [x] 👍 even better evaluation of attributes to display for title of selected feature
- [x] 👍 layer panel now responds much quicker to layer reset and expanding large groups
- [x] 👍 disable accordion collapse when layer search is active

#### Fixed

- [x] 🪲 info panel failed to show feature details after initial viewing
- [x] 🪲 wait for local datasource check before attempting to get local layers
- [x] 🪲 table view now working for catalogue layers

### June 2022

Our biggest release in over two years!

#### New

- [x] ⚡ **QGIS integration** ⚡
  * import layer catalogue from QGIS Server and other WMS/WFS sources
  * build nested layer groups from WMS/QGIS catalogues
  * create Admin Guide, add content for using QGIS to create and maintain layer catalogues
- [x] ⚡ dynamically evaluate the most suitable attribute from any selected feature to display as feature's title
- [x] ⚡ display loading spinner for WMS layers

#### Improved

- [x] 👍 compact layer view
- [x] 👍 extend table view to full page width
- [x] 👍 upgrade to React v17
- [x] 👍 when zooming to search result, zoom in/out to accommodate geometry or bounding coords of target

#### Fixed

- [x] 🪲 prevent page from reloading on first visit

### April 2022

- [x] 👍 improved: make hyperlinks look nice in widget results
- [x] 👍 improved: enable vector tile basemap to be the default basemap
- [x] 👍 improved: prevent search results from covering search input box
- [x] 🪲 fixed: prevent child lookup failing when a parent value is blank

### March 2022

- [x] ⚡ new: support for vector tile basemaps
- [x] 👍 improved: zoom to more suitable zoom level when searching on mobile
- [x] 🪲 fixed: restore highlighting for selected features
- [x] 🪲 fixed: remove scrollbar from widget
- [x] 🪲 fixed: ensure map always zooms out to show feature selected from "Nearby" list

### February 2022

- [x] ⚡ new: implement optional setting to display all feature details directly in What's Here results instead of only previewing the feature's title
- [x] 👍 improved: enable users to view more than 10 results in Search query
- [x] 👍 improved: improve cursor focus in Search panel
- [x] 🪲 fixed: clear old search results when doing a new search

### January 2022

- [x] ⚡ new: display coordinates in alternative projections
- [x] 👍 improved: enable tolerance of WMS GetFeatureInfo clicks for QGIS Server
- [x] 👍 improved: update Property Planning Report links

---

### December 2021

- [x] 👍 improved: apply subtle fill to generic polygon styles
- [x] 👍 improved: display selected feature areas with three significant digits
- [x] 👍 improved: increase precision of measuring tool results
- [x] 👍 improved: enable line feature labels to follow the line
- [x] 🪲 fixed: layer alignment with basemap/aerial when printed
- [x] 🪲 fixed: generate valid Esri geometries on selected features to enable better integration with ArcGIS Online

### November 2021

- [x] ⚡ new: display legend generated from SLD
- [x] 👍 improved: filter address search results by municipality
- [x] 👍 improved: use a default style for layers with missing/invalid styles

### October 2021

- [x] 👍 improved: consolidate highlight styles
- [x] 👍 improved: change caching policy for public layers to avoid serving outdated data
- [x] 👍 improved: upgrade to OpenLayers 6.8
- [x] 👍 improved: upgrade to TurfJS 6.5
- [x] 👍 improved: open Config Manager page in new tab

---

!!!

Please excuse the gaps in our timeline!

Sometimes we get busy building, and we forget to celebrate our wins and record our accomplishments.

We'll do a better job going forward keeping track of all new development and improvements!

<!-- TO-DO: add to timeline from https://github.com/pozi/PoziApp/commits/ -->
<!-- https://github.com/pozi/PoziApp/pulls?q=is%3Apr+sort%3Aupdated-desc+is%3Aclosed -->

!!!

---

### July 2021

- [x] ❌ removed: support for Internet Explorer

---

### July 2019

- [x] ⚡ new: export map as georeferenced image (.png + .pngw worldfile)

### June 2019

- [x] ⚡ new: user map annotations
- [x] ⚡ new: print options - A4, A3, Landscape, Portrait

### May 2019

- [x] ⚡ new: full-screen mode
- [x] 👍 improved: layer control now remembers its last scroll position

---

### April 2018

- [x] ⚡ new: Jotform support
- [x] ⚡ new: GeoServer authentication
- [x] 👍 improved: new notification about limited compatibility on older mobile operating systems
- [x] 🪲 fixed: support encoded URLs for better cross-application support

---
### December 2017

- [x] 👍 improved: nicer aerial photo button
- [x] 👍 improved: when user turns off a WMS layer, deselect any selected features from that layer
- [x] 🪲 fixed: cleared old cookies to prevent Firefox reporting "weak encryption"
- [x] 🪲 fixed: changed GeoServer API requests to be compatible with new GeoServer
- [x] 🪲 fixed: hide search options for private layers when user is public
- [x] 🪲 fixed: interpretation of WMS result coordinates by Internet Explorer
- [x] 🪲 fixed: un-highlight selected feature when user closes drawer

### November 2017

- [x] ⚡ new: Mapzen address search option
- [x] 👍 improved: custom info symbol in menu
- [x] 🪲 fixed: tickboxes in layer panel weren't on when opening layer panel on load
- [x] 🪲 fixed: feature highlight disappeared when using measuring tool

### October 2017

- [x] ⚡ new: new search functionality for GeoJSON layers and various APIs
- [x] 👍 improved: autocomplete search now allows user to hit Enter to accept
- [x] 🪲 fixed: search option radio buttons in IE failed to display
