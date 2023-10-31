---
order: 0
---

# Introduction

:::updated
31 Oct 2023
:::

:::note Under Construction

*This page is a work in progress.*

:::

## Azure AD Pozi Support Account

In order for the Pozi team to be able to provide support and troubleshoot any potential issues, we ask our clients to configure the [Pozi Support](prerequisites.md#support-account) domain user with the same permissions/groups/roles as the users of Pozi through Azure AD Application Proxy.

If it's not possible or practical for the Pozi Support domain user to be given Azure AD permissions, you may choose to create a separate user account with the Azure AD permissions. In this case, no administrator privileges are required.

## Information to send to Pozi

After completion of the configuration, email us with the following information:

- [ ] The **internal** app proxy URl (something like `http://<internal-server-name>/pozi/`)
- [ ] The **external** app proxy URl (something like `https://poziserver-<entra-application-client-name>.msappproxy.net/pozi/`)
- [ ] The **`client id`** (sometimes called 'application id') and has the following structure: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx. The client id is defined in Enterprise Applications => Properties.
- [ ] The **`tenant id`**, which looks like xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx. The tenant id is defined in Azure Active Directory => Overview."
- [ ] A copy/paste and/or screenshot of all the relevant settings

This information is [not sensitive](https://stackoverflow.com/questions/57306964/are-azure-active-directorys-tenantid-and-clientid-considered-secrets) and can be emailed directly to the Pozi support team at support@pozi.com.

In addition to the information above, if you have not done so already, provide the Azure AD credentials (email address and password) of the [Pozi Support](prerequisites.md#support-account) user account. Please get in touch with us on how to securely provide us with these details.




## Authentication mechanism

The authentication that Pozi Web App uses to communicate with Pozi Server through Entra ID is OAuth 2.0 through Microsoft's MSAL.js v2.0 JavaScript library


## Helpful Resources:

* [Microsoft identity platform and OAuth 2.0 authorization code flow](https://learn.microsoft.com/en-au/entra/identity-platform/v2-oauth2-auth-code-flow)

