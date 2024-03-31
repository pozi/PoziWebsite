---
title: Cloud Hosting
order: 50
---

## CloudFront

Pozi uses CloudFront for managing the access to S3 buckets and EC2 instances etc. It handles things like adding CORS headers and document expiry settings.

### Cache Invalidation

If a CloudFront cache needs to be partially or fully cleared, either use the web interface or the command-line to create a cache invalidation (i.e. a instruction to clear the cache).

### Web Interface

* Visit https://us-east-1.console.aws.amazon.com/cloudfront/v4/home?region=us-east-1#/distributions/
* Select the relevant distribution (e.g. `imageproxy.pozi.com`)
* Click on the 'Invalidations' tab
* Click on the 'Create invalidation' button
* Add one or more 'object paths', e.g.:

   `/https://config.pozi.com/public/files/catalogues/*`

   `/https://config.pozi.com/public/files/catalogues/deeca-iws-wms-northerngrampians-lga.*`

   `/https://iws.maps.vic.gov.au/erdas-iws/ogc/wms/RDP?REQUEST=GetMap&SERVICE=WMS&VERSION=1.3.0&FORMAT=image%2Fwebp&STYLES=default&TRANSPARENT=true&LAYERS=VMIMAGERY_LZ_northerngrampians_2023nov09_air_vis_20cm_epsg7854.ecw*`

Note: The file name and path is case-sensitive.  Also, giving the exact path does not seem to always correctly invalidate.  Please check to make sure the required file has been refreshed.

### Command-line

Make sure that you have the [AWS CLI utils](https://aws.amazon.com/cli/) installed on your machine and have created a profile with the relevant credentials for accessing the Pozi services (e.g. a profile called 'pozi').

* Find the ID of the distribution that you are interested in using, e.g.:

   `aws cloudfront list-distributions --profile pozi`
* Create the invalidation:

  `aws cloudfront create-invalidation --profile pozi --distribution-id XXXXXXXXXXXXXXXX --paths "/https://config.pozi.com/*"`
* Track the progress using the ID that was provided after running the previous step:

  `aws cloudfront get-invalidation --profile pozi --distribution-id XXXXXXXXXXXXXXXX --id YYYYYYYYYYYYYYYYYYY`