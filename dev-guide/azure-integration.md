---
---

# Azure Integration

Reference: https://docs.microsoft.com/en-us/azure/active-directory/app-proxy/application-proxy

![](/dev-guide/img/azure-app-proxy-overview.png)

## Site URL

Using `[sitename].enterprise.pozi.com` forces the user to authenticate before proceeding to the Pozi site. These users will gain access to their organisation's private datasets.

Public users should continue to use `[sitename].pozi.com`. They will not be prompted to authenticate, and they will have access to only public data.

## Site Configuration

The following settings are configured in the Pozi Config Manager, within the Site settings.

### Azure Application Proxy Settings

#### Enabled

When enabled, Pozi will attempt to authenticate the user when in 'enterprise' mode.

Due to a bug in the interface, it's not possible to tick this box directly using a mouse. Instead, place the cursor in the text box preceding the tickbox, press Tab to focus the cursor on the tickbox, then press Space to toggle the tickbox.

#### Application Proxy external URL

The externally accessible URL to access the Application Proxy.

This is defined in Enterprise Applications => Application Proxy => External Url

==- Examples (preferred)

- `https://poziserver-loddonvicgovau.msappproxy.net/pozi/`
- `https://poziserver-northburnettqldgovau.msappproxy.net/pozi/`
- `https://poziserver-queenscliffevicgovau.msappproxy.net/pozi/`

==- Examples (other)

- `https://pozi-cardiniavicgovau.msappproxy.net/`
- `https://pozi.ngshire.vic.gov.au/`

==-

#### Application Proxy internal URL

The internally only accessible URL to access the Pozi Server from within the client's network.

This is defined in Enterprise Applications => Application Proxy => Internal Url.

==- Examples

- North Burnett: `http://gis2/pozi/`
- Cardinia: (none)
- Northern Grampians: `https://local.pozi.com/`
- Loddon: `https://poziserver.loddon.vic.gov.au/iis/`

==-

#### Authentication Type

Token based authentication is recommended and the default. Only use cookie based authentication as a fallback.

#### Client ID / Application ID

This is sometimes also called 'application id' and has the following structure: `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`.

The client id is defined in Enterprise Applications => Properties.

#### Authority

This has the following structure: `https://login.microsoftonline.com/<tenant id>`, where tenant id looks like `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`.

The tenant id is defined in Azure Active Directory => Overview.

#### Scopes

Scopes provide the possibility to request extra permissions. Make sure that the scopes are valid. Otherwise, the whole authentication process may fail.

Also, make sure to at least add a scope for user impersonation, which is a requirement for Application Proxy access (e.g. `https://<pozi-server-at-client>.msappproxy.net/pozi/user_impersonation`.

Scopes are defined in App Registrations => `<the pozi server app>` => Expose an API.

==- Examples (preferred)

- `https://poziserver-loddonvicgovau.msappproxy.net/pozi/user_impersonation`
- `https://poziserver-northburnettqldgovau.msappproxy.net/pozi/user_impersonation`

==- Examples (other)

- `https://pozi-cardiniavicgovau.msappproxy.net/user_impersonation`
- `https://pozi.ngshire.vic.gov.au/user_impersonation`

==-

### Local Data Source

#### PoziServerURL

==- Examples (preferred)

- `https://poziserver-loddonvicgovau.msappproxy.net/pozi/qgisserver/wfs3.json`
- `https://poziserver-northburnettqldgovau.msappproxy.net/pozi/qgisserver/wfs3.json`

==- Examples (other)

- `https://pozi-cardiniavicgovau.msappproxy.net/iis/qgisserver/wfs3.json`
- `https://pozi.ngshire.vic.gov.au/iis/qgisserver/wfs3.json`

==-

:::note Note:

Pozi requires that the `PoziServerURL` field points to a valid JSON endpoint that is behind the Azure App Proxy. If there is no URL configured or if it does not go through the Azure App Proxy, Pozi will not attempt to authenticate the user.

:::

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

## Resource Check

Example: https://pozi-cardiniavicgovau.msappproxy.net/resourcecheck/cardinia.json

## Troubleshooting

==- User is logged in to Microsoft but cannot access private datasets

Ensure the user's browser's privacy settings allow third party cookies.

==-
