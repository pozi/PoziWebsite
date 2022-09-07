---
description: Azure AD Application Proxy integration for Pozi GIS
icon: dot
tags: [Pozi Enterprise Cloud, Cardinia Shire Council]
---

# Azure AD Application Proxy

*Azure AD integration is a feature of the **Pozi Enterprise Cloud** offering.*

Pozi's [Azure AD Application Proxy](https://azure.microsoft.com/en-au/services/active-directory/) integration enables your organisation's staff and other authorised users to access internal data sources in Pozi without needing to be connected to your network.

![](/dev-guide/img/azure-app-proxy-overview.png){style="width:500px"}

## How it works

1. user visits the dedicated Pozi Enterprise address (eg `cardinia.enterprise.pozi.com`)
2. Pozi app sends a request to client's MS App Proxy endpoint (eg `https://pozi-cardiniavicgovau.msappproxy.net/resourcecheck/cardinia.json`)
3. if user is signed in to their Microsoft account, Pozi continues to load, and the user will have access to the internal datasets configured for Pozi within the organisation's app proxy

If the user is not already logged in, the browser is redirected to the Microsoft login page.

![](./img/azure-ad-login.png){style="width:600px"}

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

### Add App

Microsoft documentation: https://docs.microsoft.com/en-us/azure/active-directory/app-proxy/application-proxy-add-on-premises-application#add-an-on-premises-app-to-azure-ad

* Azure Application Proxy to point to https://local.pozi.com/ (or other previously configured DNS forward address)
* ensure "Pre Authentication" is Azure Auth, not passthrough

Other settings:

![](/dev-guide/img/azure-settings.png){style="width:600px"}

When configured correctly, a request from a logged-in user to URL (for example)...

`https://pozi-cardiniavicgovau.msappproxy.net/resourcecheck/cardinia.json`

...should return the same response as a local request to...

`https://local.pozi.com/resourcecheck/cardinia.json`

Ensure it doesn't return a response to a non-logged-in or anonymous user.

### Site URL

Using `<sitename>.enterprise.pozi.com` forces user to authenticate before proceeding to the Pozi site. These users will gain access to the private datasets.

Public users should continue to use `<sitename>.pozi.com`. They will not be prompted to authenticate, and they will have access to only public data.

### Register Pozi

* Set Pozi up in Azure as a registered app (admin privileges required): https://docs.microsoft.com/en-us/azure/healthcare-apis/register-application
* Record the Application id (also known as as client id)
* Set 'Allow public client flows' to true as Pozi is a public application and does not need access to secrets
* Add the following URI as a registered application:
  * `https://<sitename>.enterprise.pozi.com`. Note; do not add a trailing slash
* Add the following redirect URIs to the application (they are also sometimes called reply URLs):
  * https://staging.pozi.com (for testing/debugging)
  * http://localhost:3000 (for development)
* Make sure that the above URIs are classed as `Single-Page Application`, otherwise you may get the following error: `AADSTS9002326: Cross-origin token redemption is permitted only for the 'Single-Page Application' client-type
   - Steps: App registration -> Authentication-> platform type: SPA
* Give Pozi the following permissions:
  - API/Permissions Name: `User.Read`, Type: `Delegated`, Admin consent required: `No`. This should allow Pozi to determine access based on a user's role(s).
