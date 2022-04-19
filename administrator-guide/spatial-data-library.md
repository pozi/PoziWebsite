---
title: Spatial Data Library
---

A well-structured data library makes it easy for organisations to maintain up-to-date data from internal and external sources.

Organisations can more easily manage data, reduce duplication, and identify sources when datasets are stored in a standard location.

## Data Library Structure

The recommended structure is a network folder hierarchy based on the name of each dataset's source organisation or department. Every dataset has a single source, and only one possible location in the hierarchy.

When naming of the network folders, it is acceptable to use any recognisable abbreviations for organisation names (eg DELWP) to keep file paths short. Individual dataset folder names are also abbreviated where the data supplier also uses a standard abbreviation (eg AAV, CIP, VMPROP).

```
GIS
├── Admin
├── Data
│   ├── DELWP
│   │   ├── VMADD
│   │   ├── VMADMIN
│   │   ├── VMELEV
│   │   ├── VMFEAT
│   │   ├── VMHYDRO
│   │   ├── VMPLAN
│   │   ├── VMPROP
│   │   ├── VMREFTAB
│   │   └── VMPLAN
│   ├── HRCC Assets
│   ├── HRCC Local Laws
│   ├── HRCC Planning 
│   ├── HRCC Rates
│   ├── PTV
│   ├── OpenStreetMap
│   └── WCMA
│       ├── Elevation
│       └── Imagery
├── Tools
└── Workspaces
```

## Popular Data Sources

### Victorian State Government

Organisations based in Victoria, Australia can download regular updates of 'Vicmap' authoritative datasets that are maintained by the Department of Environment, Land, Water and Planning (DELWP).

Go to [https://datashare.maps.vic.gov.au/](https://datashare.maps.vic.gov.au/), search for the datasets of interest, and set up repeat orders. Pozi is compatible with any of the formats listed, with the exception of MapInfo Extended.

#### Recommended Download Frequency

Weekly

- [Vicmap Address](https://datashare.maps.vic.gov.au/search?q=uuid%3Db9e9146d-8378-5c37-b6cd-63e3a8d05d02)
- [Vicmap Property Simplified 1](https://datashare.maps.vic.gov.au/search?q=uuid%3Da752b99e-baee-502e-a58b-7d15fa6c57cd)

Monthly

- [Vicmap Admin](https://datashare.maps.vic.gov.au/search?q=uuid%3D1553f19f-3b03-5e40-924e-6355eb9a3f89)
- [Vicmap Transport](https://datashare.maps.vic.gov.au/search?q=uuid%3D8970aa3a-c4af-55bb-afeb-63d3e89bbd69)
- [Vicmap Planning](https://datashare.maps.vic.gov.au/search?q=uuid%3Da0678401-c119-5f54-9107-e81ce1218e5c)
- [Vicmap Features of Interest](https://datashare.maps.vic.gov.au/search?q=uuid%3Dd257574b-6630-51f1-a53e-a9a23c0de1c8)
- [Vicmap Crown Land Tenure Basic](https://datashare.maps.vic.gov.au/search?q=uuid%3D862f83b9-2fd5-5748-92e8-7a11e27fc131)

Yearly

- [Vicmap Reference Tables](https://datashare.maps.vic.gov.au/search?q=uuid%3Db83285a2-0355-5b2d-8dcd-fe56438b7e89)
- [Vicmap Elevation](https://datashare.maps.vic.gov.au/search?q=uuid%3D91b4951f-4cef-5768-a412-3a64679ee627)
- [Vicmap Hydro](https://datashare.maps.vic.gov.au/search?q=uuid%3D23a264f2-d5aa-5b73-95a2-812454053147)
- [Vicmap Vegetation](https://datashare.maps.vic.gov.au/search?q=uuid%3D68360f70-5737-51f8-9f8c-70a764d01aa5)
