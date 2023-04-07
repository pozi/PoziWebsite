---
description: Azure AD Application Proxy integration for Pozi GIS
icon: dot
tags: [Pozi Enterprise Cloud]
---

# Azure AD Application Proxy

*Azure AD integration is a feature of the **Pozi Enterprise Cloud** offering.*

Pozi's [Azure AD Application Proxy](https://azure.microsoft.com/en-au/services/active-directory/) integration enables your organisation's staff and other authorised users to access internal data sources in Pozi without needing to be connected to your network.

![](/dev-guide/img/azure-app-proxy-overview.png){style="width:500px"}

## How it works

1. user visits the dedicated Pozi Enterprise address (eg `<sitename>.enterprise.pozi.com`)
2. Pozi app sends a request to client's MS App Proxy endpoint (eg `https://poziserver-<clientname>.msapproxy.net/pozi/qgisserver/wfs3.json`)
3. if user is signed in to their Microsoft account, Pozi continues to load, and the user will have access to the internal datasets configured for Pozi within the organisation's app proxy

If the user is not already logged in, the browser is redirected to the Microsoft login page.

![](./img/azure-ad-login.png){style="width:600px"}

Once signed in, users will have access to internal datasets for as long their Microsoft account remains logged in.

### Permissions

Whether a user can access private datasets is based on whether the user is given permission by the organisation to access the MS App Proxy endpoint that is dedicated for Pozi.

As long as the staff member or other authorised user has permission to access the MS App Proxy endpoint ( eg `https://poziserver-<clientname>.msapproxy.net/pozi/`), then they will have access to the internal datasets that have been configured within Pozi.

### Site Url

Using `<sitename>.enterprise.pozi.com` enables a user to be authenticated before proceeding to the Pozi site. These users will gain access to the private datasets.

Public users should continue to use `<sitename>.pozi.com`. They will not be prompted to authenticate, and they will have access to only public data.

**Example**:

* Public Url: `https://<sitename>.pozi.com/`
* Staff Url: `https://<sitename>.enterprise.pozi.com/`

## Azure Configuration

### Application Proxy (Enterprise Application)

`Azure`: **Enterprise Applications** ⇒ **PoziServer** ⇒ **Application Proxy**

Follow the Microsoft documentation for set up:

https://docs.microsoft.com/en-us/azure/active-directory/app-proxy/application-proxy-add-on-premises-application#add-an-on-premises-app-to-azure-ad

Choose, depending on the way the Pozi Server has been configured one of the 2 following sections for the correct settings.


+++ Current

*IIS + QGIS Server only (i.e. without Pozi Connect Server)*

The following settings are for a Pozi server setup with only QGIS Server and IIS.

* **Internal Url** : `http://<servername>/pozi/`. Replace `<servername>` with the actual name of the server.

  To test internal Url on the internal network, opening the following Url in the browser should show a QGIS Server landing page:`http://<servername>/pozi/qgisserver/wfs3`

* **External Url**: `https://poziserver-<clientname>.msapproxy.net/pozi/`.

  The `<clientname>` is a name that has been given to the organisation by MS Azure. The Url `https://poziserver-<clientname>.msapproxy.net/pozi/qgisserver/wfs3` should show the same landing page as in the Internal Url section above.

* **Pre Authentication**: `Azure Active Directory`.

Do **not** choose `Passthrough` as that will give any visitor access to the internal network, potentially creating a security risk.

When configured correctly, a request from a logged-in user to Url (for example)...

`https://poziserver-<clientname>.msapproxy.net/pozi/qgisserver/wfs3.json`

...should return the same response as a local request to...

`http://<servername>/pozi/qgisserver/wfs3.json`

Ensure it doesn't return a response to a non-logged-in or anonymous user.

+++ Legacy

*Pozi Connect Server + local DNS*

The following settings are for a Pozi server setup with a Pozi Server installation that proxies all QGIS Server and IIS requests.

* **Internal Url** : `https://local.pozi.com` (or any other Url that uses a local DNS with a locally signed SSL certificate pointing to the server that runs PoziServer)

  When visiting the above Url on the internal network, it should show a Pozi Connect Server welcome page.

All other settings here (like **External Url** and **Pre Authentication** are the same as above)

When configured correctly, a request from a logged-in user to Url (for example)...

`https://poziserver-<clientname>.msapproxy.net/resourcecheck/<sitename>.json`

...should return the same response as a local request to...

`https://local.pozi.com/resourcecheck/<sitename>.json`

Ensure it doesn't return a response to a non-logged-in or anonymous user.

+++

#### Other settings:

<!-- ![](/dev-guide/img/azure-settings.png){style="width:600px"} -->

**Advanced**:

* **Translate Urls in headers**: ☑
* **Translate Urls in application body**: ☑
* **Validate Backend SSL certificate**: ☑


### App Registration

`Azure`: **App Registrations** ⇒ **PoziServer**

* Set Pozi up in Azure as a registered app (admin privileges required): [https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal#register-an-application-with-azure-ad-and-create-a-service-principal)
* Record the Application id (also known as as client id) as well as tenant id

#### Authentication

##### Web - Redirect URIs

Add the App Proxy Url to `Redirect URIs` to the `Web` section. E.g.:
  * `https://poziserver-<clientname>.msappproxy.net/pozi/`

##### Single Page Application - Redirect URIs

Add the following `Redirect URIs` to the `Single-page application` section:
  * `https://<sitename>.enterprise.pozi.com/`
  * If needed, add any extra URIs that the client uses (e.g. `https://<sitename>-azure.enterprise.pozi.com/`)
  * `http://localhost:3000/` (for Pozi development purposes)
  * `https://staging.pozi.com/` (for client testing/debugging)
  * `https://staging.pozi.com/master/` (for client testing/debugging)

All the URIs above will be needed for Pozi to be fully functional.

Please make sure that the URIs all have a trailing slash ('/') and note that the localhost URI is `http` (and not `https`).

#### Implicit grant and hybrid flows:

* `Access tokens` and `ID tokens` should remain unchecked

#### Advanced settings:

 * Set `Allow public client flows` to `No`

#### Authorisation

All going well, it should be possible to visit the App Proxy Url (in our example case: `https://poziserver-<clientname>.msappproxy.net/`). If an error is shown like: `Sorry, but we’re having trouble with signing you in.` with a text similar to below, then we will need to give the relevant users/groups access.



:::note Example authorisation error:

AADSTS50105: Your administrator has configured the application Pozi Server ('xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx') to block users unless they are specifically granted ('assigned') access to the application. The signed in user 'xxxxxxxxx.xxxxxxx@xxxxxxxxxxx.xxx.xxx.xx') is blocked because they are not a direct member of a group with access, nor had access directly assigned by an administrator. Please contact your administrator to assign access to this application.

:::

**Steps to authorise users/groups**

`Azure`: **Enterprise Applications** ⇒ **PoziServer**

* In the Azure Portal, go to Enterprise Applications, select the enterprise application for the Pozi Application Proxy
* Under `Manage`, select `Users and groups`
* If no users/groups have been defined, it will say something like `No application assignments found`
* Click on `+ Add user/group`
* In the next page, click on the text `None selected` under`Users and groups
* On the right a panel should pop up with all available users/groups. Assuming that we want all users to have access, click on the group `All users` and click on `Select` in the bottom.
* It is worth taking note of the the info text `When you assign a group to an application, only users directly in the group will have access. The assignment does not cascade to nested groups.`, especially when one chooses a group that contains other groups. In the case of `All users`, this is not an issue.
* Under `Select a role`, the role `User` is preselected and cannot be changed. That is OK.
* Click on `Assign` in the bottom of the page.

Access should now be granted to the application proxy and the Url should be accessible.

#### API Permissions

* Give Pozi the following permissions:
  - API/Permissions Name: `User.Read`, Type: `Delegated`, Admin consent required: `No`. This should allow Pozi to determine access based on a user's role(s).

<!-- Important: a user authenticated with the client's Azure AD through Pozi will need to their tokens to have been provided with permission to access all of the App Proxy (i.e. `https://poziserver-<clientname>.msapproxy.net/`). -->

### Azure AD Pozi Support Account

In order for us to be able to provide support and troubleshoot any potential issues, we ask our clients to create an account that has the same permissions/groups/roles as the users of Pozi through Azure AD Application Proxy.

### Information to send back to Pozi

After completion of the configuration, Pozi would like to receive the following from the client:

* The **internal** app proxy URl (something like `http://<servername>/pozi/`)
* The **external** app proxy URl (something like `https://poziserver-<clientname>.msappproxy.net/pozi/`)

* The **`client id`** (sometimes called 'application id') and has the following structure: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx. The client id is defined in Enterprise Applications => Properties.

* The **`tenant id`**, which looks like xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx. The tenant id is defined in Azure Active Directory => Overview."

* The **credentials** (email address + password) of the Pozi Support user account that will have access to the Pozi Azure AD Application Proxy. Please get in touch with us on how to securely provide us with these details.

* A copy/paste and/or screenshot of all the relevant settings



<!-- ### Token-based Authentication/Authorisation

:::note Under Construction

*This section is a work in progress. Please get in touch with us before following any of the steps below*

:::

* TO BE WRITTEN -->

<!-- ### App Roles

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

* The roles defined above will automatically become available in the authentication tokens in the browser, allowing Pozi to change its behaviour depending on the roles that the user (or the group they are in) have. -->

