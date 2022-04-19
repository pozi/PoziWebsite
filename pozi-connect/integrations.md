---
title: Pozi Connect Integrations
sidebar_label: Integrations
---

## CouncilWise

* Alpine Shire Council
* Ararat Rural City Council

## Civica Authority

* Hindmarsh
* Horsham
* Maribyrnong
* West Wimmera
* Surf Coast
* Murrindindi
* Swan Hill
* Mildura
* Wellington
* Northern Grampians
* Moira
* Melton
* Colac Otway

## Ibis Rating Manager

* Buloke
* Indigo
* Towong
* Moorabool
* Loddon

## Infor Pathway

* Bendigo
* Monash
* Ballarat
* Nillumbik
* Frankston
* Glen Eira
* Kingston
* Latrobe
* Yarra Ranges
* South Gippsland
* Shepparton
* Moreland
* Moonee Valley
* Maroondah
* Macedon Ranges
* Knox
* East Gippsland

## TechnologyOne

* Campaspe
* Manningham
* Wangaratta
* Hepburn
* Warrnambool
* Baw Baw
* Stonnington
* Mount Alexander
* Mornington Peninsula
* Dandenong
* Corangamite
* Casey

## TechnologyOne Cloud

Pozi Connect is configured to extract the information it needs from CSV files, extracted nightly from the TechOne cloud database.

CSVs required:

```
nucAssociation
nucLand
nucLocation
nucProp_Location
nucProperty
nucStreet
```

The nucAssociation table is likely to be quite large (possibly 100s of MBs). You may be able to apply a filter to it to reduce it down before downloading it.

```sql
SELECT key1,key2,association_type,date_ended
FROM nucAssociation
WHERE association_type = 'PropLand'
```

* Mitchell
* Port Phillip
