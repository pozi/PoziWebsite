---
description: GIS integration for Infor Pathway
icon: dot
tags: [Pozi Enterprise, URL protocol handler, Frankston City Council]
---

# Infor Pathway

## Application Link

### Link-Out from Pozi

Infor Pathway is a Windows application that supports linking via a URL protocol handler.

For any selected property feature, Pozi users can click a link to launch the Pathway application which displays the property's details.

An example link for Pathway looks like this:

[pathway://pthprod/lpag0010/maintain?enquiry=1&tpklpaprop=168896](pathway://pthprod/lpag0010/maintain?enquiry=1&tpklpaprop=168896)

For any PC on which a URL protocol handler has been installed, clicking this link will launch the Pathway application.

#### Supported Forms

*Taken from Infor's 'Pathway URL Protocol Handler.docx' document, Nov 2020.*

| Protocol Handler | Code | Example URL |
|---|---|---|
| Customer Service Request Enquiry | acrg1000 | `pathway://pthprod/acrg1000/display?tpkacrrequ=104729` |
| Customer Service Request Maintenance | acrg1000 | `pathway://pthprod/acrg1000/maintain?tpkacrrequ=104729` |
| Application Enquiry | lapg6900 | `pathway://pthprod/lapg6900/display?enquiry=1&tpklapclas=541&tpklapappl=104733` |
| Application Maintenance | lapg6900 | `pathway://pthprod/lapg6900/display?tpklapclas=541&tpklapappl=104733` |
| Application Bulk Maintenance | lapf6900 | `pathway://pthprod/lapf6900/pthlink?tpklapclas=541&appltpklist=104733,1779,93179,3571` |
| Licence Enquiry | llcg6900 | `pathway://pthprod/llcg6900/display?enquiry=1&tpklapclas=229&tpklapappl=104731` |
| Licence Maintenance | llcg6900 | `pathway://pthprod/llcg6900/display?enquiry=1&tpklapclas=229&tpklapappl=104731` |
| Licence Bulk Maintenance | llcf6900 | `pathway://pthprod/llcf6900/pthlink?tpklapclas=229&appltpklist=104731,1781,93181,59359` |
| Property Enquiry | lpag0010 | `pathway://pthprod/lpag0010/maintain?enquiry=1&tpklpaprop=104737` |
| Property Maintenance | lpag0010 | `pathway://pthprod/lpag0010/maintain?tpklpaprop=104737` |
| Property Bulk Maintenance | lpaf6000 | `pathway://pthprod/lpaf6000/pthlink?multiselect=1&proptpklist=104737,81787` |
| Animal Enquiry | lang1000 | `pathway://pthprod/lang1000/maintain?enquiry=1&tpklananml=104739` |
| Animal Maintenance | lang1000 | `pathway://pthprod/lang1000/maintain?tpklananml=104739` |
| Animal Bulk Maintenance | lanf1000 | `pathway://pthprod/lanf1000/pthlink?multiselect=1&anmltpklist=104739,81789,93189` |
| Assessment Enquiry | lrag1010 | `pathway://pthprod/lrag1010/maintain?enquiry=1&tpklraassm=104741` |
| Assessment Maintenance | lrag1010 | `pathway://pthprod/lrag1010/maintain?tpklraassm=104741` |
| Assessment Bulk Maintenance | lraf1010 | `pathway://pthprod/lraf1010/pthlink?assmtpklist=104741,81791,93191,48611,70657` |
