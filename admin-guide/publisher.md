---
title: Publisher
tags: [Pozi Enterprise]
---

*Available for Pozi Enterprise and Enterprise Cloud customers*

The Pozi Publisher enables your organisation to export selected internal datasets out to the web, where they can be viewed by the public in the Pozi App.

The Pozi Publisher is configured on your network as a dedicated workflow for the Pozi Pipeline ETL tool. Running as a batch file, either on-demand or as a scheduled task, Publisher scans through a folder of spatial data files and generates web-ready GeoJSON files for each that are then synchronised to the Pozi web platform.

## How It Works

Publisher combines these resources on your organisation's network to create the publishing workflow:

* Pipeline ETL (Extract, Translate, Load) - batch application that is installed with Pozi Server
* source dataset folder - contains source datasets (eg, Shapefiles or MapInfo files), or VRT files that reference the source datasets
* Publisher batch file - launches the Pipeline process and specifies the source and destination folders
* sync folder - the destination folder, which is configured for automatic syncing to the Pozi cloud platform
* scheduled task - the trigger for running the Publisher on a routine basis (eg, daily)

## Adding Datasets for Publishing

When Pozi Publisher is first configured for you, you will be supplied with some initial configuration (VRT) files. These existing files will be used as the basis for adding new datasets to the process.

1. go to `C:\Program Files (x86)\Pozi\userdata\tasks\public-datasets\`
2. pick an existing VRT file and open it up in a text editor (eg Notepad++)
3. File > Save As...and give it a unique name that suitably describes the dataset
4. edit the following components:
  * `OGRVRTLayer`: name of dataset
  * `SrcDataSource`: file path of dataset (ensure that the path is one recognised by the server)
  * `SrcLayer`: table name (in the case of MapInfo tables, it is the file name without the folder path or file extension)
5. File > Save
6. open up the VRT file in QGIS to check that everything is formatted correctly - if you can see the layer in QGIS, then it has been formatted correctly
7. run the `C:\Program Files (x86)\Pozi\userdata\tasks\publisher.bat` batch file (or you can wait until the overnight process runs it)
8. check the output GeoJSON file at `C:\Program Files (x86)\Pozi\userdata\public\` - open the file in a text editor, or open it in QGIS to check the GeoJSON layer displays properly
9. (optional) use QGIS to style the layer and export an SLD file with the same name as the GeoJSON file and save it to the `public` folder
10. email support@pozi.com with details of the new layer:
  * GeoJSON file name
  * name of destination layer group in Pozi
  * any requests for specific styling

Pozi Support will configure your Pozi site to display the newly synchronised layers.

## Troubleshooting

==- Layers are not displaying in Pozi

  On the server on which Pozi Server is installed, navigate to `C:\Program Files (x86)\Pozi\userdata\public\` and check that the GeoJSON file exists. If the file exists, load the file in QGIS to check that it is a valid file.

  If the GeoJSON file is not able to display in QGIS, re-run the Publisher batch file to regenerate the GeoJSON.

  If the problem persists, check the source VRT file exists in the `public-datasets` folder. If the file exists, load the file in QGIS to check that it is a valid file.

  If the VRT file is not able to display in QGIS, open the VRT file in a text editor and check that the content is valid and points to a valid data source.

  If the problem persists, check that the source dataset can displayed in QGIS.

==- Layers are not syncing

  On the server on which Pozi Server is installed, go to Control Panel > Administrative Tools > Services > PoziConnectServer > right-click > Restart.

==-
