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

## Azure Configuration

### App Proxy

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

### App Registration

* Set Pozi up in Azure as a registered app (admin privileges required): [https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal#register-an-application-with-azure-ad-and-create-a-service-principal)
* Record the Application id (also known as as client id) as well as tenant id

#### Authentication

* Add the App Proxy URL to `Redirect URIs` to the `Web` section. E.g.:
  * `https://pozi-cardiniavicgovau.msappproxy.net/`
* Add the following `Redirect URIs` to the `Single-page application` section:
  * `https://<sitename>.enterprise.pozi.com/`
  * `https://staging.pozi.com/feature-azure/` (for testing/debugging)
  * `http://localhost:3000/` (for development)
  * If needed, add any extra URIs that the client uses (e.g. `https://cardinia-qgis.enterprise.pozi.com/`)
* In `Implicit grant and hybrid flows`: `Access tokens` and `ID tokens` should remain unchecked
* In `Advanced settings`: Set `Allow public client flows` to `No`

#### API Permissions

* Give Pozi the following permissions:
  - API/Permissions Name: `User.Read`, Type: `Delegated`, Admin consent required: `No`. This should allow Pozi to determine access based on a user's role(s).

Important: a user authenticated with the council's Azure AD through Pozi will need to their tokens to have been provided with permission to access all of the App Proxy (i.e. `https://pozi-cardiniavicgovau.msappproxy.net/` as well as `https://pozi-cardiniavicgovau.msappproxy.net/iis/qgisserver/`). 

### Site URL

Using `<sitename>.enterprise.pozi.com` forces user to authenticate before proceeding to the Pozi site. These users will gain access to the private datasets.

Public users should continue to use `<sitename>.pozi.com`. They will not be prompted to authenticate, and they will have access to only public data.

### Token-based Authentication/Authorisation

:::note Under Construction

*This section is a work in progress. Please get in touch with us before following any of the steps below*

:::

* TO BE WRITTEN

### App Roles

:::note Under Construction

*This section is a work in progress. Please get in touch with us before following any of the steps below*

:::

It is possible to assign app roles to users and groups and make those roles available through our token-based authentication/authorisation (which is currently still experimental).

The instructions below follow the [Microsoft guide on adding app roles](https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-add-app-roles-in-azure-ad-apps).

#### Create App Roles

* Go to the App Proxy application in the `App registrations` sections and select `App roles`
* Create the following app role for read access to Pozi Server:
  - Display name: `Pozi Server Read Access`
  - Allowed member types: `Users/Groups`
  - Value: `PoziServer.Read`
  - Description: `Read access to Pozi Server`
  - Do you want to enable this app role?: `✔`
* Create the following app role for write access to Pozi Server:
  - Display name: `Pozi Server Write Access`
  - Allowed member types: `Users/Groups`
  - Value: `PoziServer.Write`
  - Description: `Write access to Pozi Server`
  - Do you want to enable this app role?: `✔`

#### Assign App Roles to Users/Groups

* Go to the App Proxy application in the `Enterprise applications` section and in the `Manage` category, select `Users and groups`
* Select all users/groups that should get read access to Pozi Server and click on `Edit` in the top of the page
* Click on `Select a role` and select the role `Pozi Server Read Access` and click on `Select` in the bottom of the page
* For enabling write access follow the same steps again but now select the role `Pozi Server Write Access`
* Currently, the Azure UI shows one row per role per user/group. That is expected behaviour.

#### App Roles in Tokens

* The roles defined above will automatically become available in the authentication tokens in the browser, allowing Pozi to change its behaviour depending on the roles that the user (or the group they are in) have.

