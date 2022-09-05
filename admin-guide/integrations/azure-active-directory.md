---
description: Azure AD Application Proxy integration for Pozi GIS
icon: dot
tags: [Pozi Enterprise Cloud, Cardinia Shire Council]
---

# Azure AD Application Proxy

*Azure AD integration is a feature of the **Pozi Enterprise Cloud** offering.*

Pozi's [Azure AD Application Proxy](https://azure.microsoft.com/en-au/services/active-directory/) integration enables your organisation's staff and other authorised users to access internal map layers in Pozi without needing to be connected to your network.

## How it works

1. user visits the dedicated Pozi Enterprise address (eg `cardinia.enterprise.pozi.com`)
2. Pozi app sends a request to client's MS App Proxy endpoint (eg `https://pozi-cardiniavicgovau.msappproxy.net/resourcecheck/cardinia.json`)
3. if user is signed in to their Microsoft account, Pozi continues to load, and the user will have access to the internal datasets configured for Pozi within the organisation's app proxy

If the user is not already logged in, the browser is redirected to the Microsoft login page.

![](./img/azure-ad-login.png)

Once signed in, users will have access to internal datasets for as long their Microsoft account remains logged in.

### Permissions

Whether a user can access private datasets is based on whether the user is given permission by the organisation to access the MS App Proxy endpoint that is dedicated for Pozi.

As long as the staff member or other authorised user has permission to access the MS App Proxy endpoint ( eg `https://pozi-cardiniavicgovau.msappproxy.net/`), then they will have access to the internal datasets that have been configured within Pozi.

### URL

Users use a separate URL that enforces a login to Azure Active Directory before the browser loads the Pozi site.

Example:

* Public URL: `https://<sitename>.pozi.com/`
* Staff URL: `https://<sitename>.enterprise.pozi.com/`

## Configuration

### Connector Group

Example:

![](/dev-guide/img/azure-settings.png){style="width:600px"}

### Access Token Lifetime

Extend the access token lifetime from 1 hour (default) to 12 hours to enable a user to continue using Pozi without the app reloading in order to refresh the access token.

Reference:

* https://docs.microsoft.com/en-us/azure/active-directory/app-proxy/application-proxy-understand-cors-issues (Option 5)
* https://docs.microsoft.com/en-us/answers/questions/63514/cors-issue-while-using-app-throught-azure-proxy-af.html
* https://docs.microsoft.com/en-us/answers/questions/656764/azuread-application-proxy-some-kind-of-timeout.html

### Register Pozi

* Set Pozi up in Azure as a registered app (admin privileges required): `https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationMenuBlade/Authentication/appId/<client_id>`
* Add the following URI as a registered application:
  * `https://<sitename>.enterprise.pozi.com` (e.g. https://cardinia.enterprise.pozi.com). Note; do not add a trailing slash
* Add the following redirect URIs to the application (they are also sometimes called reply URLs):
  * https://staging.pozi.com (for testing)
  * http://localhost:3000 (for development/debugging)
* Make sure that the above URIs are classed as `Single-Page Application`, otherwise you may get the following error: `AADSTS9002326: Cross-origin token redemption is permitted only for the 'Single-Page Application' client-type.

App registration -> Authentication-> platform type: SPA
