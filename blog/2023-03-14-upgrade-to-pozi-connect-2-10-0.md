---
slug: upgrade-to-pozi-connect-2-10-0
author: Simon O'Keefe
tags: [Pozi Connect]
description: An announcement for users of Pozi Connect
category: Pozi Connect
---

# Upgrade to Pozi Connect 2.10.0

*Note: this announcement is for users of the Pozi Connect desktop application.*

![](/static/img/undraw/undraw_collaborating_re_l43g.svg){style="width:300px"}

Pozi Connect 2.10.0 is now available for you to download and install.

[!button variant="secondary" icon="checklist" size="2xl" text="Upgrade to Pozi Connect 2.10.0"](/pozi-connect/installation/)

---

## Why Upgrade?

In January 2023, DEECA introduced a change to Vicmap data model that impacted Pozi Connect's ability to differentiate road parcels from normal parcels. As a consequence, Pozi Connect started generating unwanted edits on the M1 related to road parcels.

<img src="/static/img/undraw/undraw_tourist_map_re_293e.svg" alt="" style="float:right;width:250px;margin:0px 40px;">

In this new release, we've adapted Pozi Connect to recognise and filter out road parcels from its results. Specifically, it uses the new `road` field in Parcel table to determine the road status instead of the existing `desc_type` field.

We've also taken the opportunity to change how Pozi Connect launches the Property Dashboard. After Pozi Connect generates the M1, it now opens a custom webpage that is targeted for the version of Pozi Connect you're currently using. The custom page enables us to put version-specific information, such as warning you if you're using an out-of-date version of Pozi Connect.

---

## What's New?

The v2.10.0 release contains the following changes since the v2.9.4 release last May.

* use new `road` field in Parcel table to determine road status instead of `desc_type`
* update Vicmap Reference tables
* launch property dashboard on custom webpage for the current version of Pozi Connect
* configuration updates for Brimbank, Buloke, Central Goldfields, Indigo, Macedon Ranges, Merri-bek, Port Phillip, Strathbogie, Towong, Wangaratta, West Wimmera

---

## Install Pozi Connect 2.10.0 Now

Our website provides step-by-step instructions for downloading and installing Pozi Connect 2.10.0.

[!button variant="secondary" icon="checklist" size="2xl" text="Get Pozi Connect 2.10.0"](/pozi-connect/installation/)

If you require assistance for this upgrade, contact support@pozi.com.

---

## Sick of M1s?

<img src="/static/img/undraw/undraw_sync_files_re_ws4c.svg" alt="" style="float:right;width:150px;margin:0px 40px;">

We have a vision to simplify the way Victorian councils integrate their property information into Vicmap.

***We've extended the deadline for submissions. If you haven't already filled in our survey, please click the button to fill in our survey!***

[!button variant="secondary" size="2xl" icon="comment" text="Read our plan, and have your say"](/land-central-station/)

