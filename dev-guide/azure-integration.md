---
---

# Azure Integration

Reference: https://docs.microsoft.com/en-us/azure/active-directory/app-proxy/application-proxy

![](/dev-guide/img/azure-app-proxy-overview.png)

## Setup

Guide client to configure:

* DNS redirection for `local.pozi.com` to server on which Pozi Server has been installed as per normal
* Azure Application Proxy to point to https://local.pozi.com/
* ensure "Pre Authentication" is Azure Auth, not passthrough (refer Cardinia notes)

*Afterthought: DNS redirection may not be required at all if the Azure App Proxy is just pointed directly to the server*

Example

https://pozi-cardiniavicgovau.msappproxy.net/ points to https://local.pozi.com/

![](/dev-guide/img/azure-settings.png)


When configured correctly, a request from a logged-in user to URL (for example)...

```
https://pozi-cardiniavicgovau.msappproxy.net/resourcecheck/cardinia.json
```

...should return the same response as a local request to...

```
https://local.pozi.com/resourcecheck/cardinia.json
```

Ensure it doesn't return a response to a non-logged-in or anonymous user.

Configure site with new resource check URL, and test accessing private datasets within Pozi app (ie, by adding as a layer) to check for any issues with CORS.

## Site URL

Using `[sitename].enterprise.pozi.com` forces user to authenticate before proceeding to the Pozi site. These users will gain access to the private datasets.

Public users should continue to use `[sitename].pozi.com`. They will not be prompted to authenticate, and they will have access to only public data.

## Resource Check

Example: https://pozi-cardiniavicgovau.msappproxy.net/resourcecheck/cardinia.json
