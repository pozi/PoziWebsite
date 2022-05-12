---
title: Building Pozi Connect
order: 0
---

## Requirements

Repositories
* [PoziConnect](https://github.com/pozi/PoziConnect)
* [PoziConnectConfig](https://github.com/pozi/PoziConnectConfig)

Software
* GitHub Desktop
* Advanced Installer software
* Resource Hacker software

## Repository Configuration

Set up symlink folder called `tasks` in PoziConnect repo that points to PoziConnectConfig repo. Example:

```
mklink /D C:\Users\Simon\GitHub\PoziConnect\tasks C:\Users\Simon\GitHub\PoziConnectConfig
```

## Prepare PoziConnectConfig Repository

* open GitHub app to commit and sync any outstanding changes in PoziConnectConfig repo
* check https://github.com/pozi/PoziConnectConfig/commits/master/~Shared and identify general changes made since last release
* check https://github.com/pozi/PoziConnectConfig/commits/master/ and identify site-specific changes made since last release
* edit `M1 Shared - Generate M1.ini` > `[Generate M1 Spreadsheet]` > `Destination`, increment the M1 version number with new minor version number (if necessary)

## Prepare PoziConnect Repository

* if there's been an update of the GDAL library, update `setenv_python.bat`
* update `PoziWebsite/docs/developer-guide/pozi-connect/m1s/history.md` with dot points about recent changes (identified above)
* if logo has changed since last release, run `PoziConnect\PoziConnect.bat` to trigger regeneration of `gui_logo_png.py`
* run `PoziConnect\build.bat`; type in new version number when prompted
* embed thumbnail logo in `PoziConnect.exe`
  * open Resource Hacker
  * File > Open > `PoziConnect\dist\PoziConnect.exe`
  * select Icon
  * Action > Replace Icon > Open file with new icon > `PoziConnect\app\PoziConnect\gui\Groundtruth.ico` > Replace
  * Save, Close
  * delete `PoziConnect\dist\PoziConnect_original.exe`
* if file `PoziConnect\dist\output\PoziConnect.log` or folder `PoziConnect\dist\backup` exist, delete them
* open GitHub app to commit and sync PoziConnect repo
* delete any outdated/unused GDAL folders from the `vendor` folder

## Build Installer

* run Advanced Installer
* File > Open > `G:\My Drive\Products\Pozi Connect\Installer\PoziConnect.aip`
* Product Details > Product version > type latest release number (above)
* when prompted about the Product Code, select 'Generate new'
* Home > Build
* check Output log for location of output msi file

## Publish Release

### GitHub

* create new PoziConnect release: https://github.com/pozi/PoziConnect/releases/new
* Tag version: (eg, v2.9.2)
* Release title: (eg Release 2.9.2)
* Description: (example)

(check https://github.com/pozi/PoziConnectConfig/commits/master; identify which councils have had changes since [last release](https://github.com/pozi/PoziConnect/releases/latest))

#### Description

Example:

> Welcome to Pozi Connect v2.x.
>
> **Click the .msi link below to download this release.**
>
> This October 2017 release contains the following changes since the June 2017 (v2.04) release:
>
> * populate most suitable property_pfi for multi-property parcels
> * enforce geometry types for output layers
> * update Pozi web links to new format
> * update Exception table generation
> * upgrade GDAL library to `release-1800-gdal-2-1-3-mapserver-7-0-6`
> * configuration updates for Hepburn, Glen Eira, Hindmarsh, Wangaratta, Moorabool
>
> See a complete history of all of Pozi Connect's changes [here](https://github.com/pozi/PoziConnectConfig/commits/master/~Shared/).
>
> **Click the .msi link below to download this release.**
>
> For installation instructions, visit [https://docs.pozi.com/pozi-connect/installation/](https://docs.pozi.com/pozi-connect/installation/)

---

* drag msi file into box 'Attach binaries..'
* click 'Publish release'
* visit [https://github.com/pozi/PoziConnect/releases/latest](https://github.com/pozi/PoziConnect/releases/latest) to confirm that it's published

---

## Pozi Connect/Server

This is the alternative distribution which, for clients who have this installed, will auto-update from the zip file we upload.

* create zip from files/folders within `PoziConnect\dist\` (ie, no overall top-level folder)
* rename zip file (eg `PoziConnectM1.2.x.x.zip`)
* upload to https://s3.console.aws.amazon.com/s3/buckets/connect.pozi.com/m1/
* set "Manage public permissions" to "Grant public read access to this object(s)"
* download `manifest-m1-production.json`
* edit with latest date and version number
* upload back to S3, make public

### Blog

* duplicate previous Pozi Connect release blog post
* update details
* publish
* copy content as HTML to clipboard

### MailChimp

* log in to https://mailchimp.com
* create new campaign: https://us3.admin.mailchimp.com/campaigns/#/create-campaign
* select audience with "PCM1 Mailing List" tag
* choose Basic template
* update content
  * insert logo
  * paste HTML from blog post
  * update footer with web link, Twitter link, and remove Facebook
* send test email, and check inbox
* send final email
