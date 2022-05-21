---
title: Integrations
---

# Pozi Connect Integrations
## Civica Authority

* Brimbank
* Hindmarsh
* Horsham
* Maribyrnong
* Surf Coast
* Murrindindi
* Swan Hill
* Mildura
* Wellington
* Northern Grampians
* Moira
* Melton
* Colac Otway

## CouncilWise

* Alpine
* Ararat
* Buloke
* West Wimmera

## Ibis Rating Manager

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

## Open Office Property.Gov

* Bass Coast
* Cardinia
* Central Goldfields
* Hobsons Bay
* Strathbogie

## SynergySoft

* Golden Plains
* Mansfield
* Pyrenees
## TechnologyOne

### On-Premise

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

### OneCouncil

* Mitchell
* Port Phillip

Pozi Connect is configured to extract the information it needs from CSV files, extracted nightly from the TechOne cloud database.

Tables required for downloading to CSV:

```
nucAssociation
nucLand
nucLocation
nucProp_Location
nucProperty
nucStreet
```

Alternatively, the table names may be as follows:

```
P1PLN_LAND
P1PLN_PROP_LOCATION
P1PLN_PROPERTY
P1PLN_STREET
P1PLN_PROP_TRANSFER
P1PRC_ASSOCIATION
```

The Association table is likely to be quite large (possibly 100s of MBs). Apply a filter to it to reduce it down before downloading it.

```sql
SELECT key1,key2,association_type,date_ended
FROM nucAssociation
WHERE association_type = 'PropLand'
```
