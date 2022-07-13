---
description: GIS integration for Open Office
icon: dot
tags: [Pozi Enterprise, Loddon Shire Council, Cardinia Shire Council]
---

# Open Office

When users select one property (with a standard click) or multiple properties (using `Ctrl+click` or the polygon selection tool), Pozi displays a button called "Send to Open Office".

When clicked, the Open Office application is launched and the selected property numbers read by the Open Office API for its specialised workflows.

![](/static/img/tweet-gallery/Open_Office_Integration.png)

## API

### Example links

==- Animal registration

```
https://community.cardinia.vic.gov.au/Secure/Content/Products/Animals/Forms/ManageRegistration.aspx?pac=2&eid=2235665
```

==- CRMS

```
https://community.cardinia.vic.gov.au/Secure/Content/Products/CustomerService/Forms/ManageEvent.aspx?pac=2&eid=15963651
```

==- Planning Application

```
http://communityhub.loddon.vic.gov.au/Secure/Content/Products/TownPlanning/Forms/ManageApplication.aspx?pac=2&eid=2227496
```

==- Others

```json
      "calculatedField": [
        {
          "title": "OPEN OFFICE HEALTH",
          "field": "PROP_PROPNUM",
          "value": "http://openoffice/Hub/public/ProcessExternalAction.aspx?Module=HEALTH%26source=ExecuteOO%26id={field}"
        },
        {
          "title": "OPEN OFFICE CRMS",
          "field": "PROP_PROPNUM",
          "value": "http://openoffice/Hub/public/ProcessExternalAction.aspx?Module=CRMS%26source=ExecuteOO%26id={field}"
        },
        {
          "title": "OPEN OFFICE TOWN PLANNING",
          "field": "PROP_PROPNUM",
          "value": "http://openoffice/Hub/public/ProcessExternalAction.aspx?Module=TP%26source=ExecuteOO%26id={field}"
        },
        {
          "title": "OPEN OFFICE BUILDING",
          "field": "PROP_PROPNUM",
          "value": "http://openoffice/Hub/public/ProcessExternalAction.aspx?Module=BUILDING%26source=ExecuteOO%26id={field}"
        },
        {
          "title": "OPEN OFFICE DEV APPS",
          "field": "PROP_PROPNUM",
          "value": "http://openoffice/Hub/public/ProcessExternalAction.aspx?Module=DEVAPPS%26source=ExecuteOO%26id={field}"
        },
        {
          "title": "OPEN OFFICE LOCAL LAWS",
          "field": "PROP_PROPNUM",
          "value": "http://openoffice/Hub/public/ProcessExternalAction.aspx?Module=LLP%26source=ExecuteOO%26id={field}"
        },
        {
          "title": "OPEN OFFICE ANIMALS",
          "field": "PROP_PROPNUM",
          "value": "http://openoffice/Hub/public/ProcessExternalAction.aspx?Module=ANIMALS%26source=ExecuteOO%26id={field}"
        },
        {
          "title": "OPEN OFFICE WASTE WATER",
          "field": "PROP_PROPNUM",
          "value": "http://openoffice/Hub/public/ProcessExternalAction.aspx?Module=WW%26source=ExecuteOO%26id={field}"
        }
      ]
```

==-
