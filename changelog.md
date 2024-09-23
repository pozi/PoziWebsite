---
layout: page
description: We strive to continually improve Pozi's capabilities. See what's new, improved and fixed in Pozi.
---

# Changelog

<img src="/static/img/undraw/undraw_completed_m9ci.svg" alt="" style="float:right;width:200px;margin:40px 40px;">

We're constantly working to improve the Pozi experience for our users based on the feedback and feature requests we receive from our clients. This includes developing new functionality, fixing bugs, improving the interface, and optimising performance.

We also offer clients the opportunity to sponsor development of new features, giving them direct input into the specification to ensure it meets their exact requirements.

[!button corners="pill" text="&nbsp;Tell us what you want to see in Pozi!"](/contact/)

---

## 2024

### June 2024

#### New

- [x] ⚡"Profiles" - focus Pozi on only the layers and layer groups associated with a selected role or workflow - like "modules", but better!

#### Improved

- [x] 👍 display What's Here target on the map when launching Pozi and when doing What's Within/Along Here
- [x] 👍 context aware info results - display info results for overlapping vector features

### May 2024

#### New

- [x] ⚡ dynamic spatial querying - use selected feature to query for intersecting features
- [x] ⚡ support for Kapish Easy Link protocol

#### Improved

- [x] 👍 upgrade to OpenLayers 9.2
- [x] 👍 improve support for curve and multicurve geometry types

### April 2024

#### Improved

- [x] 👍 improve support for displaying base64 encoded images
- [x] 👍 enable WMS legend URL parameters to be overridden
- [x] 👍 use unlocked padlock symbol to show dataset access status
- [x] 👍 upgrade to OpenLayers 9
- [x] 👍 use current map view extent for default print scale

#### Fixed

- [x] 🪲 hide Property PFI selection option when not required
- [x] 🪲 fix support for GML layers

### March 2024

#### New

- [x] ⚡ right-click options for selecting features and intersecting features
- [x] ⚡ support for buffers (positive and negative) in spatial intersection queries

#### Improved

- [x] 👍 enable custom child datasets to be used as display layers
- [x] 👍 ignore layer folders that are empty or contain only hidden layers
- [x] 👍 hide datasets without geometries from layer panel

### February 2024

#### Improved

- [x] 👍 automatically generate spatial queries for child datasets
- [x] 👍 enable datasets to be used as both a child dataset and a layer
- [x] 👍 make MapShare address searches compatible with widgets
- [x] 👍 add Nearmap attribution
- [x] 👍 prevent users from copying share links that are not yet active
- [x] 👍 update About tab info with new links and styling
- [x] 👍 whitelist Infor Pathway application protocol links
- [x] 👍 add support for ArcGIS Online WMS catalogues
- [x] 👍 report if invalid Entra ID tenant id is used
- [x] 👍 enable table view to sort number fields numerically

#### Fixed

- [x] 🪲 fix child dataset request so that any query containing null ids return valid (empty) result
- [x] 🪲 fix Report function for private layers

### January 2024

#### New

- [x] ⚡ display map legend in print output

#### Improved

- [x] 👍 improve support for Esri vector tiles
- [x] 👍 add support for MultiPoint features in WMS GetFeatureInfo requests
- [x] 👍 add support for alternative proxy servers
- [x] 👍 clean up info panel by removing redundant layer icon
- [x] 👍 notify user if link-in feature is not found

#### Fixed

- [x] 🪲 exclude irrelevant results when a search contains an apostrophe
- [x] 🪲 safely ignore *"all other values"* style category that QGIS automatically generates to preserve styling for other categories
- [x] 🪲 render a layer in a default style if QGIS Server is unable to export the layer's style to SLD
- [x] 🪲 ensure top What's Here result is highlighted when doing a complex selection while there is an active vector layer
- [x] 🪲 enable table view to cope with layers without an id field
- [x] 🪲 enables features with all null values to display in map

---

## 2023

### December 2023

#### New

- [x] ⚡ search for features in any vector layer!

### November 2023

#### Improved

- [x] 👍 automatically fetch and display legends for any active WMS layer
- [x] 👍 present search options in drop-down list instead of radio buttons
- [x] 👍 reduce Google Analytics traffic by eliminating triggering on hover events
- [x] 👍 improve support for WA SLIP services
- [x] 👍 add support for GeoJSON sources without properties
- [x] 👍 notify user when there is an issue with connecting to a local data source

### October 2023

#### Improved

- [x] 👍 cleaner look and feel for layer panel
- [x] 👍 add support for Vicmap vector tile basemap
- [x] 👍 add support for map ids in Google Maps for accessing non-default basemaps
- [x] 👍 allow label layer to switched off without switching off any linked layer
- [x] 👍 better handle images through Azure App Proxy so user doesn't need to re-authenticate
- [x] 👍 use three-dots icon for info results options (replacing table icon)
- [x] 👍 allow Azure proxy endpoint to be set for each site
- [x] 👍 hide WMS legend label for single symbol layers
- [x] 👍 improve ordering of search results
display alternative title for GetFeatureInfo features when specified title field is empty
add support for various geometry types for GetFeatureInfo requests

#### Fixed

- [x] 🪲 fix Google Spreadsheet layer integration
- [x] 🪲 prevent app sending Google basemap requests when layer is disabled
- [x] 🪲 make annotation layer not selectable to prevent display issues

### September 2023

#### New

- [x] ⚡ display tables of selected features and any linked datasets
- [x] ⚡ interactive bulk selection - return intersecting features from all open layers based on user defined area

#### Improved

- [x] 👍 simplify URLs that contain a single-click *What's Here* target
- [x] 👍 remove feature limits on DEECA WFS datasets in *What's Here* results

### August 2023

#### New

- [x] ⚡ fullscreen button
- [x] ⚡ enable URL link-ins based on any available search options

#### Improved

- [x] 👍 send fewer WMS/WMTS requests when zooming with mouse wheel
- [x] 👍 open Jotform Comments tab by default
- [x] 👍 add support for styling polygon objects with point symbols
- [x] 👍 enable highlighting of selected features from WMS non-WGS84 layers
- [x] 👍 remove outdated information from About panel
- [x] 👍 don't change cursor to hand icon when hovering over non-queryable feature
- [x] 👍 fit large legend images in layer panel
- [x] 👍 use only outdoor Google Street View images

### July 2023

#### New

- [x] ⚡ enable users to download vector layers in multiple format options - GeoJSON, SHP, KML, GeoPackage, CSV and other popular formats
- [x] ⚡ display progress bar on loading screen
- [x] ⚡ add support for default QGIS SVG symbols

#### Improved

- [x] 👍 add support for Authority application protocol
- [x] 👍 allow administrators to disable download options
- [x] 👍 allow administrators to disable child datasets without removing entirely
- [x] 👍 upgrade to latest version of NodeJS
- [X] 👍 upgrade to latest GeoStyler and remove our workaround for layer opacity bug

#### Fixed

- [x] 🪲 fix potential endless loop when checking for local data source
- [x] 🪲 don't show tooltips for basemaps and imagery layers

### June 2023

#### New

- [x] ⚡ support for cloud-synced catalogues from QGIS
- [x] ⚡ support for Maplibre GL vector tile sources
- [x] ⚡ support for Google Basemap
- [x] ⚡ support for dynamically styled SVG symbols from QGIS
- [x] ⚡ support for FlatGeobuf vector format

#### Improved

- [x] 👍 add support for beta Vicmap vector tile basemap
- [x] 👍 don't display tooltips for non-selectable layers
- [x] 👍 enable override of catalogue layer selectability
- [X] 👍 enable override for WMS image tile sizes
- [X] 👍 upgrade to latest versions of OpenLayers and GeoStyler

#### Fixed

- [x] 🪲 prevent page refresh from touch gesture on mobile
- [x] 🪲 fix touch event registering in the wrong spot on mobile

### May 2023

#### New

- [x] ⚡ map feature tooltips!
- [x] ⚡ Pozi Community Forum - online collaboration for Pozi clients
- [x] ⚡ monthly analytics reports

#### Improved

- [x] 👍 support field alias names in table view, filter and report modes
- [x] 👍 add SSO logout button
- [x] 👍 smoother load experience - show buttons only after map is loaded and controls are usable
- [x] 👍 enable Enterprise Cloud customers to preview any development branch in its own custom test site
- [x] 👍 add projection support for catalogues and WMS layers
- [x] 👍 enable catalogues to appear as folders inside of layer groups
- [x] 👍 enable user to download annotation layer, whether the user created the annotations or not
- [x] 👍 add WFS projection plus GML loader support
- [x] 👍 update to new Vic Gov data endpoints
- [x] 👍 smoother load experience - show buttons only after map is loaded and controls are usable

#### Fixed

- [x] 🪲 fix errors when there are no layer attributes

### April 2023

#### Improved

- [x] 👍 add support for tiled layers from WMS catalogue
- [x] 👍 enable radio buttons as alternative to tickboxes for custom imagery layer groups
- [x] 👍 add catalogue configuration option to order layers alphabetically
- [x] 👍 upgrade OpenLayers, GeoStyler and more to latest versions

#### Fixed

- [x] 🪲 fix waste collection next pickup calculation misreporting date as 'Today' instead of 'Tomorrow' in some circumstances
- [x] 🪲 fix issue that prevented enterprise sites from installing Pozi as a Progressive Web App on mobile devices

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

---

## 2022

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

## 2021

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
