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

## Plugins

### WFS Output Extension

1. go to download https://github.com/3liz/qgis-wfsOutputExtension/releases/latest and download the `wfsOutputExtension.1.x.x.zip` file
2. extract the `wfsOutputExtension` folder from zip file and put into `C:\OSGeo4W\apps\qgis-ltr\plugins\` (ie, you'll end up with this folder: `C:\OSGeo4W\apps\qgis-ltr\plugins\wfsOutputExtension\`)
3. backup the existing `definitions.py` file
4. open the `definitions.py` file in a text editor and append the following text to the bottom:
    ```python
        GeoJSON = Format(
            content_type='application/x-geojson',
            filename_ext='geojson',
            force_crs=None,
            ogr_provider='GeoJSON',
            ogr_datasource_options=(),
            zip=False,
            ext_to_zip=(),
        )
    ```
5. check that the text starting with `GeoJSON` aligns horizontally with the closing bracket above it - then save the file
6. open IIS > select server > Fast CGISettings > qgis_mapserv.fcgi.exe > Edit > Environment variables, and confirm that there is an environment variable for `DEBUG_WFSOUTPUTEXTENSION=1` (see [here](iis.md#configure-environment-variables) for more information) - if not, add it
7. in IIS, recycle the `PoziQgisServer` application pool

Other OGR formats can be similarly added. See https://gdal.org/drivers/vector/index.html for a complete list of available formats.

```
        <insert output file extension> = Format(
            content_type='application/x-<insert output file extension>',
            filename_ext='<insert output file extension>',
            force_crs=None,
            ogr_provider='<insert name from "Short name" column from OGR table linked above>',
            ogr_datasource_options=(),
            zip=False,
            ext_to_zip=(),
        )
```

## Graphics

For any PC from which QGIS projects will be created and maintained, configure QGIS with [Font Awesome](../qgis/setting-up-qgis.md#font-awesome).

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
  * live site: `https://[sitename].enterprise.pozi.com/`
  * staging/testing site: `https://staging.pozi.com/main/#/site[sitename]/enterprise[true]/`
  * config page: `https://staging.pozi.com/main/#/site[sitename]/config[true]/preview[true]/enterprise[true]/`
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

