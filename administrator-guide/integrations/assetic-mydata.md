---
title: Assetic myData
tags: [Pozi Enterprise]
---

Assetic myData is a Windows application that supports linking via a URL protocol handler.

For any selected asset feature, Pozi users can click a link to launch the myData application which displays the asset's details.

An example link for myData looks like this:

[mydata://action=goto&assetCategory=Buildings&assetID=BD0021](mydata://action=goto&assetCategory=Buildings&assetID=BD0021)

For any PC on which a URL protocol handler has been installed, clicking this link will launch the myData application.

An example configuration in the VRT file is as follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<OGRVRTDataSource>
    <OGRVRTLayer name="Buildings">
        <SrcDataSource>\\nhillDB2\MapData\Assets\Building\Building.TAB</SrcDataSource>
        <SrcSQL dialect="sqlite">
            select
				*,
                '&#60;a href="mydata://action=goto&#38;assetCategory=Buildings&#38;assetID=' || Asset_ID || '" target="_blank" &#62;Open in myData&#60;/a&#62;' as "Application Link"
            from Building
        </SrcSQL>
    </OGRVRTLayer>
</OGRVRTDataSource>
```

!!!note

Some of the HTML link text characters (eg "`<`") require replacement codes (eg "`&#60;`") to avoid breaking the XML format of the VRT file.

!!!