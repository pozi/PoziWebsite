---
title: Land Central Station
visibility: hidden
layout: central
---

#
<br/>
<br/>

<img src="/static/img/undraw/undraw_sync_files_re_ws4c.svg" alt="" style="float:right;width:250px;margin:0px 40px;">

# Land Central Station

<big>A vision to simplify the way Victorian councils integrate their property information into Victoria's statewide map</big>

Seamless synchronisation of council property information to a **cloud data hub** - a centralised source of truth for property information for every Victorian council.

---

## Vision

We at Pozi want to improve the efficiency of Victoria's property and address data maintenance process.

We have a plan to eliminate the friction between the councils and the Victorian state government when exchanging critical property information.

---

## Background

Victorian councils maintain the source of truth for much of the state's property information.

<img src="/static/img/undraw/undraw_small_town_re_7mcn.svg" alt="" style="float:left;width:250px;margin:0px 40px;">

The Victorian [Department of Environment, Land Water and Planning](https://delwp.vic.gov.au) (DELWP) relies on this information for its Vicmap Address and Property datasets. However, the current data exchange process puts responsibility on under-resourced councils to frequently prepare and submit lists of property data updates via complex spreadsheets (M1s).

<br clear="all" />
<br/>

### Problem

The current system requires from councils:

* specialised knowledge (typically GIS staff) - even though councils maintain their property data in dedicated property systems, the preparation of M1s requires extensive knowledge of the Vicmap data model and M1 rules
* antiquated workflows (tracking changes, filling in spreadsheets, uploading files)
* valuable staff resources (time better spent on serving the council's own needs)

--![](https://i.imgur.com/rlp9JKS.jpg)--

The exchange is made complicated because of the M1 format:

* must include only the records that have changed
* must add information that the council doesn't maintain internally
  * PFI numbers
  * various flags (outside property, new road, multi-assessment, etc)
  * edit codes (telling DELWP how to update the data)
* manual upload process to VES
* councils receive feedback once a year about how well they're doing

The current system is difficult to automate and innovate upon.

<br clear="all" />
<br/>

### Why Does It Matter?

#### For Councils

<img src="/static/img/undraw/undraw_process_re_gws7.svg" alt="" style="float:right;width:250px;margin:0px 40px;">

* councils spend significant time on compiling and supplying data to DELWP that would that would be better spent on serving the council's own needs
* as staff change or go on leave, there's a breakdown in the process, and it may be weeks or months between critical data updates

#### For DELWP

* data quality varies across the state according to how well resourced individual councils are
* inherent data quality issues - data gridlocks where DELWP can't update Vicmap to reflect the council's version because there is no M1 edit code that can do the trick (eg, changing multi-parcel multi-assessments)
* it's currently impractical for DELWP to innovate within the M1 system because it would require changing the M1 format/edit codes and re-educating 79 councils

---

## Solution

**Land Central Station** is a centralised data clearinghouse of property information from all Victorian councils.

<img src="/static/img/undraw/undraw_start_building_re_xani.svg" alt="" style="float:right;width:350px;margin:0px 40px;">

It is designed to:

* reduce the friction of data exchange between councils and DELWP
* automate property data maintenance to better suit a modern digital cadastre

### How It Works

1. council property data is synchronised to a central web platform

2. the platform automatically processes and compiles the data into a single uniform property dataset

3. DELWP and other approved authorities can pull data from the combined resource on demand in the format of their choosing (M1, full dump, filtered extracts, audits, discrepancy reports, etc)

With DELWP having complete access to the combined authoritative property information from the councils, they have everything they need to update their map base.

### Components

#### Cloud Platform

A secure cloud-hosted platform provides a centralised source of truth for property information from every Victorian council.

<img src="/static/img/undraw/undraw_server_status_re_n8ln.svg" alt="" style="float:right;width:250px;margin:0px 40px;">

* API for syncing data
* data processing workflow for transforming and combining datasets from multiple councils
* interactive web map for performing any manual spatial adjustments such as rural addresses and custom property boundaries
* dashboard to provide status of recent loads, match stats, data discrepancy reports, etc
* API for DELWP to retrieve statewide council datasets

#### Local File Sync

<img src="/static/img/undraw/undraw_going_up_re_86kg.svg" alt="" style="float:right;width:250px;margin:0px 40px;">

On the council side, a simple data sync tool installed at each council and configured for their specific property system to generate and upload a nightly extract of property information. Alternatively, councils may choose to set up FME or another tool of their choice to push data to the cloud platform.

---

## Benefits

#### For Councils

<img src="/static/img/undraw/undraw_my_current_location_re_whmt.svg" alt="" style="float:right;width:250px;margin:0px 40px;">

* reduce complexity and the need for specialised knowledge within councils
* reduce burden on council resources
* increase frequency of updates
* improve data quality by avoiding data gridlocks

#### For DELWP

* replacing 79 points of contact with single API call to retrieve authoritative property data for the whole state
* reduce risk of councils falling behind in providing updates
* potential to increase data update frequency
* council data can be audited constantly, instead of once a year
* replace expensive and outdated workflow for loading changes
* improve relationships with councils by reducing their burden
* show leadership in government by adopting modern technologies

---

## Our Expertise

**Pozi** is uniquely placed to develop this platform.

We've worked with every council in Victoria (through M1 and PIQA projects), building custom property data integrations to 79 different property data schemas, across seven different property systems, on a range of database platforms.

Our Pozi Connect software is installed at most Victorian councils, and already integrated into councils' property systems. The software will be adapted to automatically sync the council's data to the cloud platform.

We've established trust and built upon relationships we've had with Victorian councils over 20 years.

We've proven we can build and maintain scalable web infrastructure with our Pozi Web GIS solution.

We're passionate about solving this problem once and for all.

---

## Questions

==- Is this solution already built?

No. But we will build it if we can get buy-in from councils and DELWP.

==- How does a cloud service help with M1s?

The cloud clearinghouse service is where each council's authoritative property information is centralised. The service enables DELWP to obtain weekly or daily snapshots of the combined property data. When DELWP has on-demand access to the complete council property information for the whole state, it won't need to re-assemble this information from dozens of spreadsheets.

To update Vicmap, DELWP will compare what changed between snapshots of the council data and then apply those changes to Vicmap. DELWP can continue to use the M1 format internally for supplying the changes to the Vicmap data maintainer. Or DELWP might use the new snapshot approach to come up with a more efficient way to get changes into Vicmap. Either way, councils never need to see an M1 again.

==- Why hasn't this been considered in the past?

Most discussions about improving the M1 process for councils have involved minor improvements, like creating new edit codes or tweaking some fields.

We have a different idea about how to better exchange data that utilises a shared services approach, modern technologies, and involves DELWP taking a greater role in the property data maintenance workflow.

==- Have you considered the challenges of implementing this?

Yes. The challenges include, but are not limited to:

* obtaining buy-in from all relevant parties
* data cleansing and preparation
* ensuring every council is catered for (resources, technology, data integrations)
* safeguards to prevent unintended updates
* transition phase
* hosting and support considerations

==- Doesn't your company already have an M1 solution?

Yes. It's called Pozi Connect, and it's used by two-thirds of Victorian councils. While it helps to alleviate some of the burden of M1s, it is limited in the level of automation it can achieve under the current data exchange system.

==- Will councils have to install Pozi's software?

No.

If your council already has Pozi Connect installed, we'll update it to synchronise the council's property data to the cloud.

For councils that don't already have Pozi Connect, we can optionally install and customise it for you.

Or you can use your own software (like FME) or automated scripts to perform the data sync.

==- Will the Vicmap data model need to change to accommodate this solution?

No.

==- What happens if council's property data is not perfect?

No council's property data is perfect. However, automation of property updates is possible with any level of data quality.

Our existing M1 solution, Pozi Connect, has been generating M1s for councils for years, and already takes this into account. It is designed to not unmatch any property or remove any address information unless the council has more a complete record for that property with which to replace it. This same conservative approach will be applied for updates from the new consolidated dataset.

==- Will we be able to review any property changes that are generated by the system?

Yes. Councils will inspect and approve change reports through the web dashboard before submission for integration into Vicmap. Over time, as the data quality improves and trust in the system has been established, there will be opportunities to automatically submit changes, and provide roll-back capabilities for any unintended changes.

==- Are there any privacy implications?

No. Only data such as address attributes and property numbers is used. No information beyond what normally appears in an M1 spreadsheet will be transferred.

==- Won't it be hard to standardise property data from every council?

No. Our existing Pozi Connect M1 and PIQA solution already uses a single, common data model/table structure (based on the PIQA format). Pozi Connect uses this model to process data from every council property system without exception.

==- Will it work for councils of all sizes?

Yes.

==- Can the solution still work if not all councils switch over?

Yes. Councils may choose to continue submitting M1s to VES using their current software and workflow.

But ideally, in a scenario in which every council decides to switch, it becomes possible for DELWP to process its updates with a more efficient format than the M1.

==- Can this platform be used for managing and sharing other council data?

Yes.

For now, we're tackling property data to eliminate the M1 burden.

But in the future, it can be adapted to synchronise and consolidate any common council dataset. The platform can automate the delivery of statewide spatial and non-spatial data from councils to any government agency.

==- Is it really going to be called Land Central Station?

Do you like the name?

If not, we'd love to hear any suggestion you have!

==-

---
## Where to now?

We want to hear from you!

<iframe
  id="JotFormIFrame-221373150678052"
  title="Land Central Station"
  onload="window.parent.scrollTo(0,0)"
  allowtransparency="true"
  allowfullscreen="true"
  allow="geolocation; microphone; camera"
  src="https://form.jotform.com/221373150678052"
  frameborder="0"
  style="
  min-width: 100%;
  height:539px;
  border:none;"
  scrolling="no"
>
</iframe>
<script type="text/javascript">
  var ifr = document.getElementById("JotFormIFrame-221373150678052");
  if (ifr) {
    var src = ifr.src;
    var iframeParams = [];
    if (window.location.href && window.location.href.indexOf("?") > -1) {
      iframeParams = iframeParams.concat(window.location.href.substr(window.location.href.indexOf("?") + 1).split('&'));
    }
    if (src && src.indexOf("?") > -1) {
      iframeParams = iframeParams.concat(src.substr(src.indexOf("?") + 1).split("&"));
      src = src.substr(0, src.indexOf("?"))
    }
    iframeParams.push("isIframeEmbed=1");
    ifr.src = src + "?" + iframeParams.join('&');
  }
  window.handleIFrameMessage = function(e) {
    if (typeof e.data === 'object') { return; }
    var args = e.data.split(":");
    if (args.length > 2) { iframe = document.getElementById("JotFormIFrame-" + args[(args.length - 1)]); } else { iframe = document.getElementById("JotFormIFrame"); }
    if (!iframe) { return; }
    switch (args[0]) {
      case "scrollIntoView":
        iframe.scrollIntoView();
        break;
      case "setHeight":
        iframe.style.height = args[1] + "px";
        break;
      case "collapseErrorPage":
        if (iframe.clientHeight > window.innerHeight) {
          iframe.style.height = window.innerHeight + "px";
        }
        break;
      case "reloadPage":
        window.location.reload();
        break;
      case "loadScript":
        if( !window.isPermitted(e.origin, ['jotform.com', 'jotform.pro']) ) { break; }
        var src = args[1];
        if (args.length > 3) {
            src = args[1] + ':' + args[2];
        }
        var script = document.createElement('script');
        script.src = src;
        script.type = 'text/javascript';
        document.body.appendChild(script);
        break;
      case "exitFullscreen":
        if      (window.document.exitFullscreen)        window.document.exitFullscreen();
        else if (window.document.mozCancelFullScreen)   window.document.mozCancelFullScreen();
        else if (window.document.mozCancelFullscreen)   window.document.mozCancelFullScreen();
        else if (window.document.webkitExitFullscreen)  window.document.webkitExitFullscreen();
        else if (window.document.msExitFullscreen)      window.document.msExitFullscreen();
        break;
    }
    var isJotForm = (e.origin.indexOf("jotform") > -1) ? true : false;
    if(isJotForm && "contentWindow" in iframe && "postMessage" in iframe.contentWindow) {
      var urls = {"docurl":encodeURIComponent(document.URL),"referrer":encodeURIComponent(document.referrer)};
      iframe.contentWindow.postMessage(JSON.stringify({"type":"urls","value":urls}), "*");
    }
  };
  window.isPermitted = function(originUrl, whitelisted_domains) {
    var url = document.createElement('a');
    url.href = originUrl;
    var hostname = url.hostname;
    var result = false;
    if( typeof hostname !== 'undefined' ) {
      whitelisted_domains.forEach(function(element) {
          if( hostname.slice((-1 * element.length - 1)) === '.'.concat(element) ||  hostname === element ) {
              result = true;
          }
      });
      return result;
    }
  };
  if (window.addEventListener) {
    window.addEventListener("message", handleIFrameMessage, false);
  } else if (window.attachEvent) {
    window.attachEvent("onmessage", handleIFrameMessage);
  }
  </script>


---
