---
description: GIS integration for CAF GISLink
icon: dot
tags: [Pozi Enterprise, Mansfield Shire Council]
---

# GISLink

GISLink by [CAF Consulting](https://www.cafconsulting.com.au/) is a Windows desktop application that enables users to trigger workflows across Windows and web applications.

Supported applications:

- SynergySoft
- Conquest
- MapInfo Professional
- Spectrum Spatial Analyst (SSA)
- ArcGIS Online

## Link-Out

![](/admin-guide/integrations/img/pozi-to-gislink.png){style="width:300px"}

1. select feature in Pozi
2. highlight the feature's ID value
3. press the GISLink shortcut key (eg `Ctrl+G`)
4. GISLink will open the application of your choice and pick the feature based on its ID

## Link-In

Configure GISLink with Pozi's standard [link-In](/admin-guide/link-ins/) parameters.

For example: `https://sitename.pozi.com/#/feature[layername.fieldname,idvalue]/`
