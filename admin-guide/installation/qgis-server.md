---
order: 90
---

# QGIS Server

## Installation

* if any previous version of QGIS Desktop has been installed using the stand-alone installer, uninstall it
* go to [https://trac.osgeo.org/osgeo4w/](https://trac.osgeo.org/osgeo4w/)
* click on link for OSGeo4W network installer to download
* navigate to downloaded `osgeo4w-setup.exe` file, right-click on it, and "Run as administrator"
* Advanced Install, accept defaults
* Install for all users, accept defaults
* Choose a download site, select top one, Next
* Select Packages
  * Desktop
    * `qgis-ltr` - click on the word 'Skip' to toggle through to the latest version
  * Libs
    * `gdal-ecw`
    * `gdal-mss`
  * Web
    * `qgis-ltr-server`
* Next > accept defaults > "Install these packages..." > Next > "I agree..." > Next
* upon completion, close the installer, then move the `osgeo4w-setup.exe` file to `C:\OSGeo4W\` for convenient access for running again to perform future upgrades

## Graphics

1. contact Pozi Support to request download link for `qgis-fontawesome-pro-6.4.0.zip`
2. download zip file from link
3. unzip file to `C:\Pozi\QGIS Assets\Pozi SVGs\`
4. confirm that the correct folder structure exists - the majority of the SVG files should be in `C:\Pozi\QGIS Assets\Pozi SVGs\fontawesome-pro-6\regular\`
5. QGIS > Settings > Options > System > SVG Paths
  - remove `C:\Users\username\AppData\Roaming\QGIS\QGIS3\profiles\default\svg\`
  - remove `C:\OSGeo4W\apps\qgis-ltr\svg\`
  - add `C:\Pozi\QGIS Assets\Pozi SVGs`

## Updating

Right-click on `C:\OSGeo4W\osgeo4w-setup.exe` file, and "Run as administrator". Accept all defaults.

If the setup file doesn't exist at that location, download it from [https://trac.osgeo.org/osgeo4w/](https://trac.osgeo.org/osgeo4w/).

During the update process, if the installer displays a message about files being locked, stop the IIS application pool.

IIS > *Server Name* > Application Pools > PoziQgisServer - right-click, and select 'Stop'

Upon completion of the update process, right-click, and select 'Start'.

## Optional Setup

==- Useful supplementary software

* [Notepad++](https://notepad-plus-plus.org/downloads/)
* [JSON Viewer browser extension](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh/)
* [TAD Viewer](https://www.tadviewer.com/) for previewing CSV files
* [DB Browser for SQLite](https://sqlitebrowser.org/dl/)

==- Useful desktop preparation

Desktop shortcuts:

* Pozi webpage shortcuts
  * live site: `https://[sitename].pozi.com/`
  * staging/testing site: `https://staging.pozi.com/master/#/site[sitename]/`
  * config page: `https://staging.pozi.com/master/#/site[sitename]/config[true]/preview[true]/`
  * Admin Guide: https://pozi.com/admin-guide/
* GIS data folder
* Pozi folder: `C:\Pozi`
* GDAL Shell: `C:\OSGeo4W\OSGeo4W.bat`
* QGIS Server log: `C:\Pozi\IIS\QgisServer\qgis_server.log`

Pin to taskbar:

* Windows > IIS
* QGIS Desktop

File associations:

* `.config` > Notepad++
* `.sld` > Notepad++
* `.vrt` > Notepad++

==-

