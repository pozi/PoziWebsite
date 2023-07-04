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
* Advanced Installer
* [Resource Hacker](http://angusj.com/resourcehacker/)

## Repository Configuration

Set up symlink folder called `tasks` in PoziConnect repo that points to PoziConnectConfig repo. Example:

```bat
mklink /D C:\Users\Simon\GitHub\PoziConnect\tasks C:\Users\Simon\GitHub\PoziConnectConfig
```

## Prepare PoziConnectConfig Repository

* open GitHub app to commit and sync any outstanding changes in PoziConnectConfig repo
* check https://github.com/pozi/PoziConnectConfig/commits/master/~Shared and identify general changes made since last release
* check https://github.com/pozi/PoziConnectConfig/commits/master/ and identify site-specific changes made since last release
* edit `M1 Shared - Generate M1.ini` > `[Generate M1 Spreadsheet]` > `Destination`, increment the M1 version number with new minor version number (if necessary)
* find and replace `'https://pozi.com/property-dashboard/2-10'` with new version number

## Prepare PoziConnect Repository

* if there's been an update of the GDAL library, update `setenv_python.bat`
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

## Create Zip Distribution

Clients in locked-down IT environments may prefer a simple zip file instead of the installer. Zip up the contents of `PoziConnect\dist` and rename the zip file from 'dist.zip' to `PoziConnect-x.x.x.zip`.

## Publish Release

### GitHub

* create new PoziConnect release: https://github.com/pozi/PoziConnect/releases/new
* Tag version: (eg, v2.10.0)
* Release title: (eg Release 2.10.0)
* Description: (example)

Example:

```md
Welcome to Pozi Connect v2.10.0

**Click the .msi link below to download this release.**

This May 2022 release contains the following changes since the March 2022 (v2.9.3) release:

* update web links
* new `.zip` distribution
* configuration updates for Port Phillip, Central Goldfields, Loddon, Strathbogie

For installation instructions, visit [https://pozi.com/pozi-connect/installation/](https://pozi.com/pozi-connect/installation/).
```

---

* drag msi file into box 'Attach binaries..'
* drag zip file into box 'Attach binaries..'
* click 'Publish release'
* visit [https://github.com/pozi/PoziConnect/releases/latest](https://github.com/pozi/PoziConnect/releases/latest) to confirm that it's published

---

## Pozi Connect/Server

This is the alternative distribution which, for clients who have this installed, will auto-update from the zip file we upload.

* create zip from files/folders within `PoziConnect\dist\` (ie, no overall top-level folder)
* rename zip file (eg `PoziConnectM1.2.x.x.zip`)
* upload to https://s3.console.aws.amazon.com/s3/buckets/connect.pozi.com/m1/
* select new zip file > Object actions > Make public using ACL > Make public
* download `manifest-m1-production.json`
* edit with latest date and version number
* upload back to S3, make public

## Notify Users

### Website

* update `pozi-connect\history.md` with dot points about recent changes (identified above)
* update `pozi-connect\m1s\release-notes.md` with summary of changes
* copy `property-dashboard-2-10` page and name it after the new version
* update the existing `property-dashboard-2-10` page to display message that user needs to upgrade
* commit changes in GitHub to publish to live site

### Blog

* duplicate previous Pozi Connect release blog post
* update details
* send test email
  * check subject line
  * check body content, spacing, alignment
  * check links
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
  * update footer with web link, remove Twitter and Facebook links
* send test email, and check inbox
* send final email
