---
title: Pozi Server
order: 100
---

Pozi Server is the software in the Pozi Enterprise suite that enables internal datasets to be served to Pozi users within the organisation’s network.

Pozi Server is installed on premise, enabling it to serve local data directly to an internal user's browser without any data leaving the network. For users to access these datasets, they must be connected to the network, either directly or via a VPN.

With Pozi Server installed and configured, the Pozi web application can access internal data in the same way it accesses external APIs from other provides (eg, DataVic, data.gov.au, HERE, ArcGIS Online, various government web services, etc). The Pozi web application aggregates internal and external data in the browser in a seamless experience for staff.

**Pozi Enterprise** sites utilise their internal network for connections to private data sources. **Pozi Enterprise Cloud** sites utilise Azure Active Directory to handle these connections.

==- <b>Pozi Server</b> or <b>Pozi Connect Server</b>?

  The Pozi Server application is often referred to as "Pozi Connect Server". This name came about from our attempt to combine our two on-premise applications, Pozi Connect and Pozi Server, into one application. We have since abandonded that approach, but the hybrid name persists in the Pozi Server interface and documentation.

  [Pozi Connect](/pozi-connect/) is the desktop application used by Victorian municipalities for generating property data change reports (M1s). It is distributed as a Windows installer, and councils are notified by email when there are new versions available to download and install.

  <b>Pozi Server</b> (what this page is about) is the API that the Pozi web app uses for accessing the local data. It runs as a Windows service (PoziConnectServer), and auto-updates with the help of the Updater (PoziConnectUpdater) service.

==-

## How Pozi Server Works

Pozi Server is configured on the network with DNS rules that enable local users to access its API via a dedicated URL (typically `local.pozi.com`).

* when a user outside the organisation's network uses Pozi, any request to `local.pozi.com` quietly fails because it's not a valid endpoint on the internet (however any data from any public data sources will load in the app as normal)
* when a user inside the client's network uses Pozi, any request to `local.pozi.com` is directed by the local DNS rules to the internal server on which Pozi Connect Server is installed, and Pozi Connect Server responds with the requested data
* IT managers maintain control over internal user access to Pozi Connect Server by configuring the network DNS and firewall rules. For example, access to Pozi Server can be restricted for specific users or groups of users with a group policy or firewall rules that blacklists the `local.pozi.com` endpoint
