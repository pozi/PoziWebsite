---
title: Publisher
---

# Pozi Publisher Configuration

Pozi's "Publisher" functionality is enabled by PoziConnect Server Sync, utilising the Pozi AWS S3 cloud storage to maintain a mirror of their local files.

## Create IAM User and Policy

- Log into [AWS Console](https://ap-southeast-2.console.aws.amazon.com/console/home?region=ap-southeast-2#)
- Go to [IAM](https://console.aws.amazon.com/iam/home?region=ap-southeast-2#/home) section (Drop down menu My Security Credentials)
- Click on `Policies` (left menu)
  - Find and select `PoziConnectSiteTest` policy
  - Click `Edit policy`
  - Click JSON tab
  - Select all and copy the JSON
  - Click Cancel
- Click `Policies` (left menu)
  - Click Create Policy
  - Click JSON tab, overwrite existing JSON with JSON text copied above
  - Change the client-specific settings (eg, change `test` to `centralgoldfields`)
  - `Next: Tags` > `Next: Review` > `Name`: enter 'PoziConnectSite[sitename]' (eg, 'PoziConnectSiteCentralGoldfields')
  - `Create Policy`
- Click on `Users` (left menu)
  - Click `Add user`
  - Set name to PoziConnectSite[SITENAME] ... e.g. PoziConnectSiteCentralGoldfields
  - Tick `Access key - Programmatic access`
  - Click `Next: Permissions`
  - Click `Attach existing policies directly`, search for "PoziConnect", then tick the box nect to the policy just created above
  - Click `Next: Tags`
  - Click `Next: Review`
  - Click `Create user`
  - Note/save the `Access key ID` and `Secret access key` (click 'Show')
  - Click `Close`

## Finalise

Enter in the credentials into the client's Pozi Connect Server [Data Sync](https://local.pozi.com/settingssync) page.

* Pozi Cloud Username: `[Access key ID]`
* Pozi Password: `[Secret access key]`
* Sitename: `[sitename]` (must be lowercase)
* click 'Submit'

![](/static/img/pozi-server-sync-credentials.png)

Restart the Pozi Server service for the settings to take effect.

Windows > Services > PoziConnectServer > right-click > Restart
