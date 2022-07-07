---
title: Azure Active Directory
icon: dot
tags: [Pozi Enterprise Cloud, Cardinia Shire Council]
---

*Azure AD integration is a feature of the **Pozi Enterprise Cloud** offering.*

Pozi's [Azure Active Directory](https://azure.microsoft.com/en-au/services/active-directory/) integration enables authorised staff to access private datasets without needing to be on the client network or VPN.

Users use a separate URL that enforces a login to Azure Active Directory before the browser loads the Pozi site.

Example:

* Public URL: `https://cardinia.pozi.com/`
* Staff URL: `https://cardinia.enterprise.pozi.com/`

![](./img/azure-ad-login.png)

Once signed in, users will have access to private datasets for as long their Microsoft account remains logged in.
