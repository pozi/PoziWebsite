---
title: Integrations
---

# Pozi Connect Integrations

## Civica Authority

* Brimbank City Council
* Hindmarsh Shire Council
* Horsham Rural City Council
* Maribyrnong City Council
* Surf Coast Shire Council
* Murrindindi Shire Council
* Swan Hill Rural City Council
* Mildura Rural City Council
* Wellington Shire Council
* Northern Grampians Shire Council
* Moira Shire Council
* Melton City Council
* Colac Otway Shire Council

## CouncilWise

* Alpine Shire Council
* Ararat Rural City Council
* Buloke Shire Council
* West Wimmera Shire Council

## Ibis Rating Manager

* Indigo Shire Council
* Towong Shire Council
* Moorabool Shire Council
* Loddon Shire Council

## Infor Pathway

* City of Greater Bendigo
* City of Monash
* City of Ballarat
* City of Darebin
* Nillumbik Shire Council
* Frankston City Council
* Glen Eira City Council
* Kingston City Council
* Latrobe City Council
* Shire of Yarra Ranges
* South Gippsland Shire Council
* Greater Shepparton City Council
* Merri-bek City Council
* Moonee Valley City Council
* Maroondah City Council
* Macedon Ranges Shire Council
* Knox City Council
* East Gippsland Shire Council

## Open Office Property.Gov

* Cardinia Shire Council
* Central Goldfields Shire Council
* Hobsons Bay City Council
* Strathbogie Shire Council

## SynergySoft

* Golden Plains Shire Council
* Mansfield Shire Council
* Pyrenees Shire Council

## TechnologyOne

### On-Premise

* Shire of Campaspe
* Manningham City Council
* Rural City of Wangaratta
* Warrnambool City Council
* Baw Baw Shire Council
* City of Stonnington
* Mount Alexander Shire Council
* Mornington Peninsula Shire Council
* City of Greater Dandenong
* Corangamite Shire Council
* City of Casey

### OneCouncil

* Hepburn Shire Council
* Mitchell Shire Council
* City of Port Phillip
* Bass Coast Shire Council

Pozi Connect is configured to extract the information it needs from CSV or XLSX files, extracted nightly from the TechOne cloud database.

Tables required for downloading:

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

The Association table is likely to be quite large (possibly 100s of MBs). You may choose to apply a filter to it to reduce it down before downloading it.

```sql
SELECT key1,key2,association_type,date_ended
FROM nucAssociation
WHERE association_type = 'PropLand'
```
