---
slug: going-cloud
authors: Simon O'Keefe
visibility: public
description: What does it mean when one of your software vendors announces that your GIS needs to "move to the cloud"?
tags: [cloud]
---

# Going cloud should mean gaining control, not losing it

![](/static/img/pexels/pexels-gülizar-şener-160320-crop.jpg)

As developers of a cloud application, you'd think we at Pozi would be the first to try to convince you to move your organisation's GIS data to the cloud. After all, Pozi is a cloud-native app that excels in the online world. It works seamlessly with online APIs to connect users with live, trusted data across the web.

But we recognise that your most critical users, data sources and systems often exist in **local ecosystems** such as your organisation's network or private cloud. That's why we developed Pozi's *hybrid cloud* architecture, which enables local data sources to be viewed securely within the Pozi application.

***So what does it mean for your organisation when one of your software vendors announces that your GIS needs to "move to the cloud"?***

What's involved, and who benefits?

---

### "Going cloud" *can* make sense if...

* your audience consists primarily of remote users or external stakeholders
* the move delivers cost savings compared to your existing on-premise solution
* the solution enables better integration with your other corporate data and applications
* your organisation retains control over its data and processes

### But why go cloud when...

#### ...your users are local

Your most critical users are the authorised users connected to your organisation's network or private cloud. They want direct access to live, authoritative data; not out-of-date, remote copies.

#### ...the applications you integrate with are local

Your organisation's corporate applications are the source of truth for vital business processes.

But when your vendor's GIS software exists in a closed, cloud-only environment, it can't usefully link to these applications. You'll need to start extracting data snapshots from your corporate databases and upload them to the vendor's cloud service in order for your users to view their own data.

#### ...your GIS data is local

Your organisation's spatial knowledge consists of a wide variety of data sources maintained by departments and individuals across your organisation. Your GIS library contains not only current data, but historic data spanning years or decades, data supplies from third-party providers, and ongoing field capture programmes.

Your data exists in local spatial databases that link directly with other corporate data sources. Even a shapefile or spreadsheet in a shared folder can form an important part of your organisation's geospatial knowledge.

Moving to the cloud means cataloguing, packaging and sending it all to an off-site host. Your data is available only to your vendor's application, and excluded from any integrations that they don't explicitly allow. Your geospatial library is no longer a shared resource for your organisation, but exclusive content for your vendor's cloud service.

#### ...your data maintenance workflows are local

You've built automated workflows for your GIS library to suit the needs of your organisation. These might include database views and triggers, batch scripts, FME workflows, live data feeds, imports from external data providers, API connections, and data exports. These will not be permitted to run on your host's servers.

---

### Evaluate the cost of "going cloud"

When a GIS software vendor dictates how your organisation will manage its GIS data, it's worth looking at the pros and cons of their proposed closed platform approach.

Ask your vendor if your organisation gains any advantages from moving to the cloud:

* will it deliver cost savings?
* will it enable better integration with your other corporate applications?
* will it allow users to access live data?
* will it enable your GIS to take advantage of advances in web technologies such as modern user interfaces, new cloud-optimised data sources, or more powerful geo-processing tools?

Or will the move be a step backwards:

* will it lock in your organisation to a single vendor for all its GIS needs?
* will it restrict integrations with your other GIS software and corporate systems?
* will it require your organisation's private corporate data to be replicated and hosted offsite?
* will it prevent the use of automated workflows such as database views and triggers?
* will it make it harder for your GIS to connect directly with APIs and data from external providers?
* will it prevent your organisation getting support from third party GIS support providers?
* will it lock you in to an ageing GIS viewer that doesn't keep pace with modern web technologies?

---

## Where to from here?

Are you hesitant for your organisation's collective geospatial knowledge to be moved into a closed platform?

<img src="/static/img/undraw/undraw_map_re_60yf.svg" alt="" style="float:right;width:250px;margin:0px 40px;">

Pozi offers you an alternative.

Pozi enables organisations like yours to regain greater control over your data and user experience.

Pozi's open architecture empowers organisations to integrate their spatial and other corporate data to suit their own requirements, and ensures maximum flexibility, control and usability.

Pozi's new [QGIS integration](/qgis/) enables administrators to configure their Pozi site using the power of QGIS, the world's most popular open-source geospatial software.

Pozi's new Azure Active Directory integration enables organisations to distribute its geospatial data to users where they need it - in the office, working remotely, or out in the field.

We've built Pozi for the future of web GIS, with live data integrations, support for web-optimised data formats, and powerful in-browser geo-processing.

[Talk to us](/contact) before committing your organisation to a cloud migration you didn't ask for.

<br/>

---

*Pozi is web platform that combines geographic information from local data sources and trusted web services to give your users the complete picture. Deploy for a fraction of cost of traditional GIS software, with no lock-in contracts. **[Learn more.](/product/)***

Photo by [Gülizar Şener](https://www.pexels.com/photo/body-of-water-during-daytime-160320/)
