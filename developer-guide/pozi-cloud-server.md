---
title: Pozi Cloud Server
order: 60
---

* From external: https://d2nozjvesbm579.cloudfront.net/
* From internal: http://local.pozi.com:3001/

## Example Requests

* https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=frankston/property-valuation-information.vrt&options=-where|propertynumber='214855'
* https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=data.gov.au/bendigo/cogb-recreation-drinking-fountains.shz

## Data Configuration

### Sync from data.gov.au

By special arrangement, selected datasets published by clients to data.gov.au can be imported/synchronised to the Pozi Cloud for caching and/or joining with other datasets.

To include a new dataset in the overnight import, update the nightly batch file.

```bat C:\Program Files (x86)\Pozi\userdata\tasks\sync-from-datagovau.bat
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Bendigo
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

cd "C:\Program Files (x86)\Pozi\userdata\ec 21354118232\data.gov.au\bendigo"

curl -L -O https://data.gov.au/dataset/b3ed25b6-c414-4386-9752-c8d1338ab75f/resource/78a2c2b1-625d-4d6a-9ca5-19b3407b79e7/download/cogb-recreation-drinking-fountains.shz
curl -L -O https://data.gov.au/dataset/f9d52171-c5f1-4d49-9fc0-77dc9a3aae8c/resource/1a550471-4aff-4550-b5ea-2ac6b2139c98/download/cogb-assets-drainage-pits.shz
curl -L -O https://data.gov.au/dataset/573626a7-2435-4145-9671-12697bb84301/resource/05affd86-b0ed-4867-a8ed-8f90b8eaa9f4/download/cogb-community-mach-centres.shz
curl -L -O https://data.gov.au/dataset/09161aac-fcdc-4be0-8284-7760d631b70e/resource/ab1c863c-20ef-4a16-b564-5d596617f383/download/cogb-assets-roads.shz
curl -L -O https://data.gov.au/dataset/09161aac-fcdc-4be0-8284-7760d631b70e/resource/8ab7005a-2a37-43e6-907d-38a497f7c37e/download/cogb-assets-roads.sld
curl -L -O https://data.gov.au/dataset/d17c9e50-fab1-40e6-b91d-6e665faf2656/resource/b3f01081-924c-41b7-989a-cf521ca136ea/download/cogb-environment-trees.shz
```

The scheduled task associated with this batch file downloads the specified datasets to a subfolder of Pozi Server's `userdata\ec 21354118232\` folder, where they can be called from the `ogr2ogr` API. For example:

https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=data.gov.au/bendigo/cogb-recreation-drinking-fountains.shz

## Server Maintenance

### EC2 Issues

* The server did not allow downloading files using IE. This page explains how to work around this: https://aws.amazon.com/premiumsupport/knowledge-center/ec2-windows-file-download-ie/
* SSL/Certificate issues between Cloudfront and the EC2 instance. Thanks to: https://bobcares.com/blog/cloudfront-wasnt-able-to-connect-to-the-origin-how-to-fix/. Solution: run PoziServer on `POZI_CONNECT_PORT=3001` with `HTTPS=false`
* The server expired the Administrator password after 45 days. Make sure to set `Password never expires` for every user, especially Administrator. You can do this via `Computer management`

### Reboot Instance

If the server ever becomes unresponsive, you can reboot it this way: 

* log in to [AWS](https://ap-southeast-2.console.aws.amazon.com/console/home?region=ap-southeast-2)
* EC2 > Intances > select PoziServerCloud instance
* Instance State > Reboot Instance
* **Note:** Do not choose any of the other options as its IP address may be changed!

Once triggered, the reboot may take several minutes to complete.

### Increase Disk Space

- Log into the machine using RDP
- Shut down the machine
- Wait for the machine to be shut down by looking at https://ap-southeast-2.console.aws.amazon.com/ec2/v2/home?region=ap-southeast-2#InstanceDetails:instanceId=i-09ddd4f41c2572984
- Create a snapshot of the volume through https://ap-southeast-2.console.aws.amazon.com/ec2/v2/home?region=ap-southeast-2#VolumeDetails:volumeId=vol-088b383963de9b728
- Request resize from 30GB to 50GB
- Start instance
- Observe that the IP address has changed from `13.211.106.117` to `13.54.118.232` (or from `ec2-13-211-106-117.ap-southeast-2.compute.amazonaws.com` to `ec2-13-54-118-232.ap-southeast-2.compute.amazonaws.com`)
- Log back into machine as administrator using RDP
- Follow instructions to inform Windows of the resize: https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/recognize-expanded-volume-windows.html
- Restart just to be sure (technically not necessary)
- Change the origin for the Cloudfront distribution of `E1UOYGEWAAJEZ1` https://console.aws.amazon.com/cloudfront/v3/home?#/distributions/E1UOYGEWAAJEZ1/origins to `ec2-13-54-118-232.ap-southeast-2.compute.amazonaws.com` and wait for it to be deployed
- Observe that PoziServerCloud is up and running again on: [Pozi Connect Server](https://d2nozjvesbm579.cloudfront.net/)
- Rename the userdata folder to reflect new IP address (eg from `ec 213211106117` to `ec 21354118232`)
- Test example ([GeoJSON request](https://d2nozjvesbm579.cloudfront.net/ogr2ogr?source=data.gov.au/bendigo/cogb-recreation-drinking-fountains.shz))
- Update any scripts that automate the transfer of data to the userdata folder ([example update](https://github.com/pozi/PoziClientConfig/commit/0f8e330a6317f2c508a9fb4dc041c963771783c7))
- Update internal notes/password manager with new RDP address
