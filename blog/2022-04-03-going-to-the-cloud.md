---
slug: going-to-the-cloud
authors: Simon O'Keefe
visibility: hidden
description: What does it mean when one of your software vendors announces that you're "moving to the cloud"?
tags: [cloud]
---

# Going cloud should mean gaining control, not losing it

![](/static/img/pexels/pexels-gülizar-şener-160320-crop.jpg)

As developers of a cloud product, you'd think we'd be biased towards moving your organisation's corporate GIS data to the cloud. After all, Pozi is a cloud-native app that excels in the online world. It works seamlessly with web APIs to connect with live, trusted data sources across government agencies and other providers.

But we recognise that your most important users and datasets and systems often live and thrive in **local ecosystems** such as your organisation's local network or virtual private cloud. That's why we developed Pozi's *hybrid cloud* architecture, to happily integrate with those critical local resources.

Without leaving the Pozi app, your most demanding users have access to live trusted data from internal and external sources. It's the best of both worlds!

***So what does it mean for an organisation that relies heavily on local data integrations when one of its software vendors announces that everything will need to "move to the cloud"?***

What's involved, and who benefits?

### "Going cloud" *can* make sense if...

* your audience consists entirely of remote users or external stakeholders
* it provides a cheaper alternative to an existing on-premise solution
* the solution enables greater integration with other cloud resources and applications
* you retain control over your data and processes

### But why "go cloud" when...

**... your users are local**

Your most critical users are the authorised users on your organisation's network or private cloud. They want fast, direct access to up-to-the-minute data; not out-of-date copies.

**... the applications you integrate with are local**

Your organisation's corporate applications are the source of truth for vital business processes. But when your GIS viewer exists only in a closed, cloud-only environment, it cannot link directly to these applications. You'll need to start taking snapshot copies of your corporate databases and upload to the cloud in order for your users to view them in your GIS.

Linking to other cloud-based applications is even more complicated. You'll need to download the data first and then upload it to the cloud GIS.

**... your data is local**

Your organisation's GIS library contains datasets maintained by departments and individuals in your organisation or collected from external parties and data capture programmes, sometimes over many years or decades.

Even a shapefile or spreadsheet in a shared folder can form an important part of your organisation's geospatial knowledge.

If you're required to migrate your organisation's data to an external host, your data becomes available only to a single application (theirs) and excluded from any services that they don't explicitly allow. Your geospatial library has become content for your host's application and not a shared resource for your organisation.

**... your workflows are local**

You've built a foundation of automated workflows within your GIS library to suit the needs of your organisation. These might include views, triggers, actions, scripts, live joins, API connections and data exports. Don't expect any of these to be permitted to run on your host's servers.

### Evaluate the cost of "going cloud"

#### Legitimate reasons to go cloud

Ask your vendor if your organisation gains any of the usual advantages of moving to the cloud:

* will it enable easier integrations with your other corporate applications?
* will it allow users to connect to live data?
* will it reduce costs?

Or will the move be a step backwards:

* will it require your organisation's on-premise corporate data to be replicated or moved permanently to their server?
* will it prevent your organisation using third party support providers?
* will it restrict integrations for your other GIS software and corporate systems?
* will it prevent the use of basic database functions such as triggers and views?
* will it make it harder for your GIS to connect directly with data from external data providers?
* can you trust that you'll get the support you need from the vendor?

--

## Where to from here?

At Pozi, we're enabling organisations to leverage their existing infrastructure to gain greater control to integrate directly with council corporate spatial and non-spatial data.

Pozi's open architecture empowers organisations to integrate their spatial and other corporate data in innovative ways, and ensures maximum flexibility and control.

Pozi's new QGIS integration enables organisations to manage their GIS using a familiar powerful tool.



---
*Photo by [Gülizar Şener](https://www.pexels.com/photo/body-of-water-during-daytime-160320/)*
