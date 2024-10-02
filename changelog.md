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

### September 2024

#### ⚡ New

- Advanced Link-Outs - link to external application from any selected feature or collection of features!
- new 'Advanced' search option - when searching a vector layer, click the 'Advanced' button to display the layer's table view which includes interactive search and filter options
- enable HTML formatting in feature titles

#### 👍 Improved

- display Street View icon to indicate that the Street View image is interactive
- display filter icon in layer tree when layer is filtered
- enable displaying ancillary layer information in the header of selected feature, configured in QGIS using new "description" layer keyword setting
- enable max zoom to be set on Esri ArcGIS vector tile layers
- clear all layer filters when user clicks reset button
- improve rendering efficiency of Layers component
- avoid WMS GetMap requests going through a proxy server twice
- improve handling of Entra ID errors
- improve search experience by stripping HTML from search values
- enable GPS follow button for all sites
- improve handling of profile names and support non-standard characters
- general background code improvements, including removing obsolete image, style and data files
- upgrade to OpenLayers 10

##### 🪲 Fixed

- restore previous child dataset behaviour to expand results by default
- don't activate layer when its What's Here result panel is expanded (unless it's a 'nearby' layer)
- always render the layer panel for legends in print view
- always expand Details pane for selected feature
- prevent Pozi reverting to default basemap when Basemaps group is collapsed
- when a profile is enabled, exclude any child datasets associated with non-matching profiles
- prevent child panels being collapsed when they should not be

### June 2024

#### ⚡ New

- "Profiles" - focus Pozi on only the layers and layer groups associated with a selected role or workflow - like "modules", but better!

#### 👍 Improved

- display What's Here target on the map when launching Pozi and when doing What's Within/Along Here
- context aware info results - display info results for overlapping vector features
- when doing bulk selections, reduce impact on server endpoints by collapsing info panels by default

### May 2024

#### ⚡ New

- dynamic spatial querying - use selected feature to query for intersecting features
- support for Kapish Easy Link protocol

#### 👍 Improved

- upgrade to OpenLayers 9.2
- improve support for curve and multicurve geometry types

### April 2024

#### 👍 Improved

- improve support for displaying base64 encoded images
- enable WMS legend URL parameters to be overridden
- use unlocked padlock symbol to show dataset access status
- upgrade to OpenLayers 9
- use current map view extent for default print scale

#### 🪲 Fixed

- hide Property PFI selection option when not required
- fix support for GML layers

### March 2024

#### ⚡ New

- right-click options for selecting features and intersecting features
- support for buffers (positive and negative) in spatial intersection queries

#### 👍 Improved

- enable custom child datasets to be used as display layers
- ignore layer folders that are empty or contain only hidden layers
- hide datasets without geometries from layer panel

### February 2024

#### 👍 Improved

- automatically generate spatial queries for child datasets
- enable datasets to be used as both a child dataset and a layer
- make MapShare address searches compatible with widgets
- add Nearmap attribution
- prevent users from copying share links that are not yet active
- update About tab info with new links and styling
- whitelist Infor Pathway application protocol links
- add support for ArcGIS Online WMS catalogues
- report if invalid Entra ID tenant id is used
- enable table view to sort number fields numerically

#### 🪲 Fixed

- fix child dataset request so that any query containing null ids return valid (empty) result
- fix Report function for private layers

### January 2024

#### ⚡ New

- display map legend in print output

#### 👍 Improved

- improve support for Esri vector tiles
- add support for MultiPoint features in WMS GetFeatureInfo requests
- add support for alternative proxy servers
- clean up info panel by removing redundant layer icon
- notify user if link-in feature is not found

#### 🪲 Fixed

- exclude irrelevant results when a search contains an apostrophe
- safely ignore *"all other values"* style category that QGIS automatically generates to preserve styling for other categories
- render a layer in a default style if QGIS Server is unable to export the layer's style to SLD
- ensure top What's Here result is highlighted when doing a complex selection while there is an active vector layer
- enable table view to cope with layers without an id field
- enables features with all null values to display in map

---

## 2023

### December 2023

#### ⚡ New

- search for features in any vector layer!

### November 2023

#### 👍 Improved

- automatically fetch and display legends for any active WMS layer
- present search options in drop-down list instead of radio buttons
- reduce Google Analytics traffic by eliminating triggering on hover events
- improve support for WA SLIP services
- add support for GeoJSON sources without properties
- notify user when there is an issue with connecting to a local data source

### October 2023

#### 👍 Improved

- cleaner look and feel for layer panel
- add support for Vicmap vector tile basemap
- add support for map ids in Google Maps for accessing non-default basemaps
- allow label layer to switched off without switching off any linked layer
- better handle images through Azure App Proxy so user doesn't need to re-authenticate
- use three-dots icon for info results options (replacing table icon)
- allow Azure proxy endpoint to be set for each site
- hide WMS legend label for single symbol layers
- improve ordering of search results
display alternative title for GetFeatureInfo features when specified title field is empty
add support for various geometry types for GetFeatureInfo requests

#### 🪲 Fixed

- fix Google Spreadsheet layer integration
- prevent app sending Google basemap requests when layer is disabled
- make annotation layer not selectable to prevent display issues

### September 2023

#### ⚡ New

- display tables of selected features and any linked datasets
- interactive bulk selection - return intersecting features from all open layers based on user defined area

#### 👍 Improved

- simplify URLs that contain a single-click *What's Here* target
- remove feature limits on DEECA WFS datasets in *What's Here* results

### August 2023

#### ⚡ New

- fullscreen button
- enable URL link-ins based on any available search options

#### 👍 Improved

- send fewer WMS/WMTS requests when zooming with mouse wheel
- open Jotform Comments tab by default
- add support for styling polygon objects with point symbols
- enable highlighting of selected features from WMS non-WGS84 layers
- remove outdated information from About panel
- don't change cursor to hand icon when hovering over non-queryable feature
- fit large legend images in layer panel
- use only outdoor Google Street View images

### July 2023

#### ⚡ New

- enable users to download vector layers in multiple format options - GeoJSON, SHP, KML, GeoPackage, CSV and other popular formats
- display progress bar on loading screen
- add support for default QGIS SVG symbols

#### 👍 Improved

- add support for Authority application protocol
- allow administrators to disable download options
- allow administrators to disable child datasets without removing entirely
- upgrade to latest version of NodeJS
- upgrade to latest GeoStyler and remove our workaround for layer opacity bug

#### 🪲 Fixed

- fix potential endless loop when checking for local data source
- don't show tooltips for basemaps and imagery layers

### June 2023

#### ⚡ New

- support for cloud-synced catalogues from QGIS
- support for Maplibre GL vector tile sources
- support for Google Basemap
- support for dynamically styled SVG symbols from QGIS
- support for FlatGeobuf vector format

#### 👍 Improved

- add support for beta Vicmap vector tile basemap
- don't display tooltips for non-selectable layers
- enable override of catalogue layer selectability
- enable override for WMS image tile sizes
- upgrade to latest versions of OpenLayers and GeoStyler

#### 🪲 Fixed

- prevent page refresh from touch gesture on mobile
- fix touch event registering in the wrong spot on mobile

### May 2023

#### ⚡ New

- map feature tooltips!
- Pozi Community Forum - online collaboration for Pozi clients
- monthly analytics reports

#### 👍 Improved

- support field alias names in table view, filter and report modes
- add SSO logout button
- smoother load experience - show buttons only after map is loaded and controls are usable
- enable Enterprise Cloud customers to preview any development branch in its own custom test site
- add projection support for catalogues and WMS layers
- enable catalogues to appear as folders inside of layer groups
- enable user to download annotation layer, whether the user created the annotations or not
- add WFS projection plus GML loader support
- update to new Vic Gov data endpoints
- smoother load experience - show buttons only after map is loaded and controls are usable

#### 🪲 Fixed

- fix errors when there are no layer attributes

### April 2023

#### 👍 Improved

- add support for tiled layers from WMS catalogue
- enable radio buttons as alternative to tickboxes for custom imagery layer groups
- add catalogue configuration option to order layers alphabetically
- upgrade OpenLayers, GeoStyler and more to latest versions

#### 🪲 Fixed

- fix waste collection next pickup calculation misreporting date as 'Today' instead of 'Tomorrow' in some circumstances
- fix issue that prevented enterprise sites from installing Pozi as a Progressive Web App on mobile devices

### March 2023

#### 👍 Improved

- maintain existing feature highlight when clicking/hovering on a non-spatial child record
- enable support for WMTS catalogues as basemaps
- support for CORS-restricted catalogues by sending requests through a proxy
- display a loading spinner while waiting for What's Here results
- when displaying dimensions for features that are more than 1 ha and less than 10 sqkm, use area unit of ha instead of sqkm
- add favicon for Conquest links
- add favicon for Greenlight links

#### 🪲 Fixed

- restore map to fullscreen after closing drawer on mobile
- Jotform forms were sometimes not shown on initial click
- 'Select by Property PFI list (CSV)' function is now working again
- prevent WMTS basemap disappearing when layer refresh button is clicked

### February 2023

#### ⚡ New

- fallback data sources: enable critical datasets to be configured a "fallback" source so that if one fails, Pozi will switch over to a secondary source

#### 👍 Improved

- make user-drawn polygon and line selections more visually consistent with the point selection
- persist user-drawn polygon and line selection on map until cleared
- remove "Nearby" layer when What's Here results are cleared
- hide Info panel from print/PDF output when there are no current results
- upgrade to OpenLayers 7.2.2 and latest versions of GeoStyler libraries
- improve Unified Search documentation

#### 🪲 Fixed

- unticking a layer's tickbox while the layer finder was displaying only filtered results caused other layers to turn off

### January 2023

#### 👍 Improved

- update HERE Map API to v2.1

---

## 2022

### December 2022

#### ⚡ New

- Azure Active Directory token-based authentication
  * more robust authentication process with more persistent login
  * support AD logins in Edge browser
  * support AD logins on iOS devices

#### 👍 Improved

- enable fine zoom level control when using Shift-click zoom
- improve load times and label appearance for QGIS Server WMS layers by changing default layer format from tiled to full image
- enable URLs that use the Pozi Proxy to be cached by service workers
- switch property endpoints for Victorian municipalities to DELWP's ArcGIS Online service for improved performance and reliability
- add support for mixed-case field names in waste collection pickup date calculation

### November 2022

#### ⚡ New

- print to scale
- obtain layer title/label field setting from QGIS Server
- grey out layer name when not visible at current zoom
- enable ArcGIS basemap integration

#### 👍 Improved

- change behaviour of clicking on partially-ticked layer folder tickbox to turn OFF all layers
- don't automatically display labels when there is a field called 'label'

#### 🪲 Fixed

- change pinch-zoom to resize the map instead of the whole interface
- enable large queries when using Azure App Proxy
- restore routing functionality by updating MapQuest API setting
- fix report function for tables that have an attribute field called 'geometry'
- fix blank background in print

### October 2022

#### ⚡ New

- add 'Select by line' selection mode
- add button to clear current selection
- add optional separate site title for internal users
- enable child datasets to be configured in QGIS projects

#### 👍 Improved

- use field name aliases from QGIS project
- sort exact matches in Unified Search by weighting
- render HTML-formatted attributes as HTML
- support categorised layer styles that are based on fields that have an alias
- display nicer message when attempting to download dataset that contains zero records
- remove StreetView animation when coming back from child data view

#### 🪲 Fixed

- prevent layers that have been configured as non-queryable in QGIS from appearing in *What's Here* results
- don't collapse layer groups that contain layers that match the layer filter
- update layer filter to not exclude some valid results
- gracefully handle tables that have an attribute field called 'geometry'
- ensure table can display when some records may contain no attributes

### September 2022

#### ⚡ New

- use layer opacity setting from QGIS Server
- enable layer catalogues to be filtered to include/exclude layers

#### 👍 Improved

- overhaul analytics capture using new Google Analytics GA4 (in preparation for monthly reports for clients)

#### 🪲 Fixed

- display clickable link in What's Here results when the selected layer's title attribute is a URL
- allow for differences in upper/lower case in layer's specified ID field

### August 2022

#### ⚡ New

- enable administrators to configure child datasets within QGIS
- display legend inline for switched-on layers
- enable loading of layers via WMTS catalogue

#### 👍 Improved

- increase precision on measurement tools
- enable more overrides for entire catalogue layers, such as opacity
- after layer search, expand only groups that contain selected layer
- unify appearance of layer options for stand-alone and catalogue layers
- hide table when layer is turned off
- render null and undefined values as empty string in table view
- use favicons from alternative URLs for frequently used links which don't have their own favicon
- switch Vicmap Basemap to new XYZ tile service

#### 🪲 Fixed

- better remember state of expanded layer groups for sites with a lot of layers
- respect field order of source data in QGIS GetFeature queries
- horizontal alignment of links in info panel
- vertical padding around vector legends
- some legend images were not displaying
- some bubble icons were not displaying
- some layer groups couldn't expand/collapse in some situations

### July 2022

#### ⚡ New

- obtain layer queryability setting from QGIS Server
- enable highlighting of selected features from QGIS Server layers

#### 👍 Improved

- faster app loads by batch loading layers
- faster app loads for return visitors by caching layer catalogue in the browser (via service workers)
- enable layer filter to narrow down results within nested layer groups
- slimmer left drawer takes up less screen real estate
- show spinner during app load if waiting for slow data sources
- even better evaluation of attributes to display for title of selected feature
- layer panel now responds much quicker to layer reset and expanding large groups
- disable accordion collapse when layer search is active

#### 🪲 Fixed

- info panel failed to show feature details after initial viewing
- wait for local datasource check before attempting to get local layers
- table view now working for catalogue layers

### June 2022

Our biggest release in over two years!

#### ⚡ New

- **QGIS integration** ⚡
  * import layer catalogue from QGIS Server and other WMS/WFS sources
  * build nested layer groups from WMS/QGIS catalogues
  * create Admin Guide, add content for using QGIS to create and maintain layer catalogues
- dynamically evaluate the most suitable attribute from any selected feature to display as feature's title
- display loading spinner for WMS layers

#### 👍 Improved

- compact layer view
- extend table view to full page width
- upgrade to React v17
- when zooming to search result, zoom in/out to accommodate geometry or bounding coords of target

#### 🪲 Fixed

- prevent page from reloading on first visit

### April 2022

- improved: make hyperlinks look nice in widget results
- improved: enable vector tile basemap to be the default basemap
- improved: prevent search results from covering search input box
- fixed: prevent child lookup failing when a parent value is blank

### March 2022

- new: support for vector tile basemaps
- improved: zoom to more suitable zoom level when searching on mobile
- fixed: restore highlighting for selected features
- fixed: remove scrollbar from widget
- fixed: ensure map always zooms out to show feature selected from "Nearby" list

### February 2022

- new: implement optional setting to display all feature details directly in What's Here results instead of only previewing the feature's title
- improved: enable users to view more than 10 results in Search query
- improved: improve cursor focus in Search panel
- fixed: clear old search results when doing a new search

### January 2022

- new: display coordinates in alternative projections
- improved: enable tolerance of WMS GetFeatureInfo clicks for QGIS Server
- improved: update Property Planning Report links

---

## 2021

### December 2021

- improved: apply subtle fill to generic polygon styles
- improved: display selected feature areas with three significant digits
- improved: increase precision of measuring tool results
- improved: enable line feature labels to follow the line
- fixed: layer alignment with basemap/aerial when printed
- fixed: generate valid Esri geometries on selected features to enable better integration with ArcGIS Online

### November 2021

- new: display legend generated from SLD
- improved: filter address search results by municipality
- improved: use a default style for layers with missing/invalid styles

### October 2021

- improved: consolidate highlight styles
- improved: change caching policy for public layers to avoid serving outdated data
- improved: upgrade to OpenLayers 6.8
- improved: upgrade to TurfJS 6.5
- improved: open Config Manager page in new tab
