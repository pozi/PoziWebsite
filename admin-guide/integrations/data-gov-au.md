---
---

# data.gov.au

:::note Under Construction

*This page is a work in progress. Please refer to our existing Help Guide for information about this topic.*

[Existing Help Guide](https://help.pozi.com/article/34-data-publishing)

:::

Data.gov.au is a federal government data portal where Australian government organisations can publish open data.

## Open Council Data Standards

The [Open Council Data Toolkit](http://opencouncildata.org/) has recommended standards for commonly published datasets.

When data is published using the recommended table structure, Pozi can apply some smarts when displaying the results. For instance, when waste collection data uses the conventions specified in the [garbage collection](http://standards.opencouncildata.org/#/garbage-collection-zones), Pozi will use the information in the table to calculate and display the next waste collection date.

## Formats

### GeoJSON

Any the GeoJSON files published to data.gov.au are directly loaded by Pozi. Any changes to GeoJSON files will be live the next time you open Pozi.

### Shapefile

Shapefiles are converted into WMS and WFS endpoints after an overnight 'ingestion' process.

After ingestion, the data is available via the following API endpoints:

* WFS: suitable for datasets with a few thousand features or fewer
* WMS: suitable for larger datasets

Preparation:

* must be WGS84
* must be zipped
* zip file can have the extension `.zip` or `.shz`

### CSV

CSVs are ingested into the data.gov.au Data API where they can be queried.

If the data contains fields named `x`, `y`, `longitude`, `lng`, `lon`, `long`, `latitude` or `lat`, Pozi will use these to generate point geometries for each feature.

Example request: https://data.gov.au/api/action/datastore_search_sql?sql=SELECT%20*%20from%20%22306f9e0d-581a-4506-8de9-20283f4334a1%22

### SLD

Data files can be accompanied by SLD style files, which will be used by Pozi to style the layer.

Example request: https://data.gov.au/api/action/datastore_search_sql?sql=SELECT%20*%20from%20%22306f9e0d-581a-4506-8de9-20283f4334a1%22

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
