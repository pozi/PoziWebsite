---
layout: central
---

# How Pozi Works

Pozi is a web application that aggregates spatial and non-spatial data from various public and private sources.

Pozi's *hybrid cloud* architecture connects users directly to live, authoritative data sources to maintain information integrity and eliminate data double-handling.

## Architecture

​Pozi utilises many data APIs, most of which are public data catalogues made available by government and commercial providers.

In addition, Pozi *Enterprise* and *Enterprise Cloud* sites have Pozi Server installed on their network which acts as an API for the an organisation's internal datasets. The internal datasets are available only to users within the network (*Enterprise*), or authorised via Microsoft App Proxy (*Enterprise Cloud*).

**Toggle between the tabs below to compare how Pozi interacts with internal datasets.**

+++ Public and Pro

![](/static/draw.io/network-diagram-public-pro.png)

Public users can easily access publicly available data.

+++ Enterprise

![](/static/draw.io/network-diagram-enterprise.png)

Users who are connected to the corporate network (either physically or via VPN) have access to internal data sources.

+++ Enterprise Cloud

![](/static/draw.io/network-diagram-enterprise-cloud.png)

Users who are signed in to their Microsoft account gain access to corporate data sources that are made available through Microsoft App Proxy.

+++

## Benefits

**Organisations** gain efficiencies from not having to import, process, store and republish data from internal and external sources.

**Users** gain confidence that they have easy, direct access to the critical information they need.
