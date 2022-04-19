---
title: Publishing to data.gov.au
---

:::note Under Construction

*This page is a work in progress. Please refer to our existing Help Guide for information about this topic.*

[Existing Help Guide](https://help.pozi.com/article/34-data-publishing)

:::

Data.gov.au is a federal government data portal where Australian government organisations can publish open data.

## Formats

### GeoJSON

Any the GeoJSON files published to data.gov.au are directly loaded by Pozi. Any changes to GeoJSON files will be live the next time you open Pozi.

### Shapefile

Shapefiles are converted into WMS and WFS enpoints after an overnight 'ingestion' process.

After ingestion, the data is available via the following API endpoints:

* WFS: suitable for datasets with a few thousand features or fewer
* WMS: suitable for larger datasets

Preparation:

* must be WGS84
* must be zipped
* zip file can have the extension `.zip` or `.shz`

### CSV

CSVs are ingested into the data.gov.au Data API where they can be queried.

### SLD

Data files can be accompanied by SLD style files, which will be used by Pozi to style the layer.

## Integration with Pozi Cloud

By special arrangement, selected datasets can be imported/synchronised to the Pozi Cloud for caching and/or joining with other datasets.

Examples:

* Bendigo - SHZ datasets are synced overnight for caching
* Macedon Ranges - zipped Shapefiles are synced overnight for caching
* Frankston - Councillor Details CSV exported and joined with Vicmap Admin Ward boundaries
* Frankston - Council Facilities GeoJSON is dynamically split into separate layers

## Alternative to data.gov.au

Pozi Enterprise enables organisations to synchronise local datasets directly to the Pozi Cloud. [Contact us](/contact/) to discuss if this option is right for your organisation.

## Support

Data.gov.au is now supported by the Australian Bureau of Statistics.

Contact support@data.gov.au and allow for up to 5 business days turn around.
