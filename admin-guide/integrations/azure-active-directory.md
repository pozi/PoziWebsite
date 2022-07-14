---
description: Azure Active Directory integration for Pozi GIS
icon: dot
tags: [Pozi Enterprise Cloud, Cardinia Shire Council]
---

# Azure Active Directory

*Azure AD integration is a feature of the **Pozi Enterprise Cloud** offering.*

Pozi's [Azure Active Directory](https://azure.microsoft.com/en-au/services/active-directory/) integration enables your organisation's staff and other authorised users to access internal map layers in Pozi without needing to be connected to your network.

## How it works

1. user visits the dedicated Pozi Enterprise address (eg `cardinia.enterprise.pozi.com`)
2. Pozi app sends a request to client's MS App Proxy endpoint (eg `https://pozi-cardiniavicgovau.msappproxy.net/resourcecheck/cardinia.json`)
3. if user is signed in to their Microsoft account, Pozi continues to load, and the user will have access to the internal datasets configured for Pozi within the organisation's app proxy

If the user is not already logged in, the browser is redirected to the Microsoft login page.

![](./img/azure-ad-login.png)

Once signed in, users will have access to internal datasets for as long their Microsoft account remains logged in.

## Permissions

Whether a user can access private datasets is based on whether the user is given permission by the organisation to access the MS App Proxy endpoint that is dedicated for Pozi.

As long as the staff member or other authorised user has permission to access the MS App Proxy endpoint ( eg `https://pozi-cardiniavicgovau.msappproxy.net/`), then they will have access to the internal datasets that have been configured within Pozi.

## URL

Users use a separate URL that enforces a login to Azure Active Directory before the browser loads the Pozi site.

Example:

* Public URL: `https://cardinia.pozi.com/`
* Staff URL: `https://cardinia.enterprise.pozi.com/`
