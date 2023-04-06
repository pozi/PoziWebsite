---
title: Sync
order: 50
---

# Pozi Sync Configuration

Pozi's sync functionality is enabled by PoziConnect Server, utilising the Pozi AWS S3 cloud storage to maintain a mirror of local files.

## Create IAM User and Policy

- Log into [AWS Console](https://ap-southeast-2.console.aws.amazon.com/console/home?region=ap-southeast-2#)
- Go to [IAM](https://console.aws.amazon.com/iam/home?region=ap-southeast-2#/home) section (Drop down menu My Security Credentials)
- Click `Policies` (left menu)
  - Click Create Policy
  - Click JSON tab, overwrite existing JSON with the following

==- Policy

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::connect.pozi.com/userdata/site-publisher",
                "arn:aws:s3:::connect.pozi.com/userdata/site-publisher/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::connect.pozi.com"
        }
    ]
}
```

==-

  - Change the client-specific settings (eg, change `site` to `gleneira`)
  - `Next: Tags` > `Next: Review` > `Name`: enter 'PoziPublisher-[site]' (eg, 'PoziPublisher-GlenEira')
  - `Create Policy`
- Click on `Users` (left menu)
  - Click `Add users`
  - Set name to 'PoziPublisher-[site]' (eg, 'PoziPublisher-GlenEira')
  - Click `Next`
  - Click `Attach existing policies directly`, search for "PoziPublisher", then tick the box nect to the policy just created above
  - Click `Next`
  - Click `Create user`
  - Click `View user`
  - Click `Security credentials`
  - Click `Create access key`
  - Click `Application running outside AWS`
  - Click `Next`
  - Set `Description tag value` to "Pozi Publisher"
  - Click `Create access key`
  - Note/save the `Access key ID` and `Secret access key` (click 'Show')
  - Click `Done`

## Onsite Configuration

+++ Pozi Publisher

Update Pozi Publisher tasks with the new credentials.

```
[AWS]
bucket=connect.pozi.com/userdata/[site]-publisher
key=[Access key ID]
secret=[Secret access key]
```

+++ Pozi Sync (Legacy)

Enter in the credentials into the client's Pozi Connect Server [Data Sync](https://local.pozi.com/settingssync) page.

* Pozi Cloud Username: `[Access key ID]`
* Pozi Password: `[Secret access key]`
* Sitename: `[sitename]` (must be lowercase)
* click 'Submit'

![](/static/img/pozi-server-sync-credentials.png)

Restart the Pozi Server service for the settings to take effect.

Windows > Services > PoziConnectServer > right-click > Restart

+++
