---
order: 20
icon: table
tags: [Pozi Connect]
---

# Pozi Connect

Pozi Connect is a powerful data extraction and processing application that extracts data from a range of spatial and non-spatial sources to generate derived datasets and map layers.

![](/static/img/screenshots/pozi-connect-maroondah-m1.png)

It generates map layers from corporate databases (spatial and non-spatial), performs spatial data analysis, converts between data formats (Esri SHP, MapInfo TAB, GeoPackage, KML, CSV, XLS/XLSX, GeoJSON and others), loads data into spatial databases (SQL Server, SQLite/Spatialite, PostGIS, Oracle Spatial), and generally automates many of the tasks that GIS Administrators find themselves doing on a regular basis.

## Why Use Pozi Connect?

PoziConnect provides a simple interface for accessing, processing, analysing and exporting spatial and non-spatial data.

It uses the power of the popular open source [GDAL/OGR translator library](https://www.gdal.org/index.html), with these important enhancements:

* it provides a simple interface that exposes typical translation functions that administrators can preconfigure using INI files and enable users to select and adjust according to specific tasks
* it uses the bare minimum information required to complete a task; for example:
  * it doesn't care if a destination file or table already exists - it has the intelligence to create or overwrite as necessary
  * it uses the specified source and destination file extensions to determine the required translation settings
* it provides access to Python and database functions within the configuration for operations like indexing and file operations

## Use Cases

### M1

!!!

**Sick of M1s?**

We have a vision to simplify the way Victorian councils integrate their property information into Vicmap.

Read our plan, and have your say!

[!button variant="secondary" size="2xl" text="Land Central Station"](/land-central-station/)

!!!

Pozi Connect M1 is a specialised workflow designed for Victorian municipalities. It uses Pozi Connect's powerful extraction and processing capabilities to generate reports of changes to councils' property and address information to feed into the Vicmap state map base.

Two-thirds of Victorian councils use Pozi Connect as a critical component in their property data maintenance workflow.

[!ref ](/pozi-connect/m1s/)

### PIQA

Each year, Victoria's Department of Energy, Environment and Climate Action (DEECA) requires councils to supply it with an extract of property and address information from their internal property systems to be used for DEECA's annual Property Information Quality Audit (PIQA).

The process of extracting, filtering and formatting this data is time consuming and often overwhelming for councils, and can require the participation and co-operation of council staff members across GIS, Rates and IT departments.

Pozi Connect enables over half of Victoria's councils to quickly and accurately compile their property and address information to submit for their annual Property Information Quality Audit (PIQA).

[!ref ](/pozi-connect/piqa/)
