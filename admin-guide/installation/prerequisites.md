---
order: 95
---

# Prerequisites

## Domain User Accounts

Prior to installation, ask your network administrator to set up two domain user accounts.

### Support Account

- [ ] example name: `PoziSupport`
- [ ] read-only permissions on GIS file locations
- [ ] trusted read-only user of GIS database and any relevant corporate databases
- [ ] **local admin on server**
  - install applications
  - view and modify IIS settings
  - view and modify Windows Services
  - view and modify DSNs
  - configure scheduled tasks
- [ ] **access for remote support by Pozi staff**
- [ ] internet access

### Service Account

- [ ] example name: `PoziService`
- [ ] read-only permissions on GIS file locations
- [ ] trusted read-only user of GIS database and any relevant corporate databases
- [ ] **permissions for running scheduled tasks**
- [ ] **credentials must never expire**
- [ ] internet access (needed to communicate with connect.pozi.com for software updates)

Provide these credentials to your Pozi support contact, along with any instructions for remote access.

## Recommended Server Specifications

Here is list of recommended server specifications:

- **CPU**: 6 Cores, Physical Server using Intel(R) Xeon(R) Gold 5317 CPU @ 3.00GHz CPUs
- **RAM**: 32 GB
- **SSDs**: Enterprise grade, storage allocation & drive layout designed relevant to your data/layers with capacity for some growth
- **OS**: Windows Server 2022