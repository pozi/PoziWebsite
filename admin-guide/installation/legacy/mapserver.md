---
title: MapServer
---

# MapServer

MapServer is an industry-standard web map server. Like QGIS Server, MapServer can be used to serve up layer catalogues to Pozi.

If you do not already have MapServer installed, we recommend installing [QGIS Server](/admin-guide/installation/qgis-server.md) instead.

For sites that have chosen MapServer as their primary way of serving map data within their organisation, below are details for installing and configuring MapServer for use with Pozi.

## Installation

On the server on which Pozi Server is installed:

MapServer is installed with Pozi Server in the following default location:

```
C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\ms\apps\mapserv.exe
```

## IIS Integration

MapServer IIS Integration using FastCGI.

Open a command prompt window (as a normal user, not an administrator), and copy and paste these commands into it.

NOTE: Pozi Server 2.2.8 ships with default configuration files for MapServer IIS Integration using FastCGI -- the following folder is assumed to exist if you have installed Pozi Server to the default `C:\Program Files (x86)\Pozi` location:

```
C:\Program Files (x86)\Pozi\server\iis\Pozi\MapServer
```

### Install IIS

In a new command prompt window, running as administrator:

```
dism /online /enable-feature /featurename:IIS-WebServerRole
dism /online /enable-feature /featurename:IIS-WebServer
dism /online /enable-feature /featurename:IIS-ApplicationDevelopment
dism /online /enable-feature /featurename:IIS-ApplicationInit
dism /Online /Enable-Feature /FeatureName:IIS-CGI
```

### Configure IIS

```
"%systemroot%\system32\inetsrv\appcmd" add app /site.name:"Default Web Site" /path:/Pozi /physicalPath:"C:\Program Files (x86)\Pozi\server\iis\Pozi"
"%systemroot%\system32\inetsrv\appcmd" add app /site.name:"Default Web Site" /path:/Pozi/MapServer /physicalPath:"C:\Program Files (x86)\Pozi\server\iis\Pozi\MapServer"
```

There should be `web.config` file located at the following path:

```
C:\Program Files (x86)\Pozi\server\iis\Pozi\MapServer
```

NOTE: If you have installed Pozi Server to a location other than the default `C:\Program Files (x86)\Pozi` then you will need to update that path in the `web.config` below:

```
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.webServer>
        <handlers>
            <add name="PoziMapServerFastCgi" path="*" verb="*" type="" modules="FastCgiModule" scriptProcessor="C:\Program Files (x86)\Pozi\server\vendor\gdal\bin\ms\apps\mapserv.exe"
            resourceType="Unspecified" requireAccess="Script" allowPathInfo="false" preCondition=""  />
        </handlers>
        <caching enabled="true" enableKernelCache="true" />
    </system.webServer>
</configuration>
```

Back in the command prompt, run the following:

NOTE: If you have installed Pozi Server to a location other than the default `C:\Program Files (x86)\Pozi` then you will need to update that path in the commands below:

```
%windir%\system32\inetsrv\appcmd.exe unlock config -section:system.webServer/handlers

"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\Program Files (x86)\Pozi\server\vendor\gdal\bin\ms\apps\mapserv.exe',idleTimeout='604800']" /commit:apphost

"%systemroot%\system32\inetsrv\appcmd" set config /section:isapiCgiRestriction /+"[path='C:\Program Files (x86)\Pozi\server\vendor\gdal\bin\ms\apps\mapserv.exe',description='PoziMapServer',allowed='True']"
```

Windows > IIS > select server > Fast CGISettings > select item we just configured > Edit > Environment variables:

```
PATH = C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal\python\osgeo;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\proj6\apps;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal\apps;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\ms\apps;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal\csharp;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\ms\csharp;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\curl;C:\Windows\system32;C:\Windows;C:\Windows\system32\WBem
GDAL_DATA = C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal-data
GDAL_DRIVER_PATH = C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal\plugins
PYTHONPATH = C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal\python;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\ms\python
PROJ_LIB = C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\proj\share
```

A quick way to set the variables above is the following:

```
:: Clear any potentially pre-existing env vars (handy when doing upgrades)
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /-"[fullPath='C:\Program Files (x86)\Pozi\server\vendor\gdal\bin\ms\apps\mapserv.exe'].environmentVariables

:: Set env vars

:: The PATH variable required
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\Program Files (x86)\Pozi\server\vendor\gdal\bin\ms\apps\mapserv.exe'].environmentVariables.[name='PATH',value='C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal\python\osgeo;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\proj6\apps;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal\apps;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\ms\apps;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal\csharp;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\ms\csharp;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\curl;C:\Windows\system32;C:\Windows;C:\Windows\system32\WBem']" /commit:apphost

"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\Program Files (x86)\Pozi\server\vendor\gdal\bin\ms\apps\mapserv.exe'].environmentVariables.[name='GDAL_DATA',value='C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal-data']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\Program Files (x86)\Pozi\server\vendor\gdal\bin\ms\apps\mapserv.exe'].environmentVariables.[name='GDAL_DRIVER_PATH',value='C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal\plugins']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\Program Files (x86)\Pozi\server\vendor\gdal\bin\ms\apps\mapserv.exe'].environmentVariables.[name='PYTHONPATH',value='C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\gdal\python;C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\ms\python']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\Program Files (x86)\Pozi\server\vendor\gdal\bin\ms\apps\mapserv.exe'].environmentVariables.[name='PROJ_LIB',value='C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\proj\share']" /commit:apphost
```

![FastCGI Settings](./img/pozi-qgis-server-iis.png)

### Application Pool

- Create PoziMapServer application pool

```
"%systemroot%\system32\inetsrv\appcmd.exe" add apppool /name:"PoziMapServer"
"%systemroot%\system32\inetsrv\appcmd.exe" set app "Default Web Site/Pozi/MapServer" /applicationPool:"PoziMapServer"

"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.applicationHost/applicationPools /+"[name='PoziMapServer'].recycling.periodicRestart.schedule.[value='02:00:00']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set apppool "PoziMapServer" /recycling.periodicRestart.time:00:00:00
"%systemroot%\system32\inetsrv\appcmd.exe" set apppool "PoziMapServer" /processModel.idleTimeout:00:00:00
"%systemroot%\system32\inetsrv\appcmd.exe" set apppool "PoziMapServer" /startMode:AlwaysRunning
"%systemroot%\system32\inetsrv\appcmd.exe" set app "Default Web Site/Pozi/MapServer" /preloadEnabled:true
```

Set the user for the PoziMapServer application pool:

- IIS > select server > Sites > Default Web Site > Pozi > MapServer > Advanced Settings > Application Pool > set to PoziMapServer

Set permissions for ```IIS AppPool\PoziMapServer``` :

- IIS > select server > Application Pools > PoziQgisServer > Advanced settings > Identity > Application Pool Identity > Custom account > enter details of the domain user that runs Pozi "service" account

![Grant read permission for Pozi Server data folder to IIS AppPool\PoziQgisServer](img/pozi-server-iis-apppool-poziqgisserver-permissions.png)

## Reference for Pozi Developers

Development notes that may contain useful additional information for Pozi developers.

* https://github.com/pozi/PoziServer/pull/40#issuecomment-972331899

## Configuring Clean Urls for MapServer FastCGI

To set up an example of MapServer FastCGI with a "clean url" configuration that hides the `MAP` query string parameter, open a Command Prompt using `Run As Administrator` and run the following commands:

```
mkdir "C:\Program Files (x86)\Pozi\server\iis\Pozi\MapServer\Next\VicMapFeatures"
xcopy "C:\Program Files (x86)\Pozi\server\iis\Pozi\MapServer\web.config" "C:\Program Files (x86)\Pozi\server\iis\Pozi\MapServer\Next\VicMapFeatures"
```

Open the new `web.config` file located in the `C:\Program Files (x86)\Pozi\server\iis\Pozi\MapServer\Next\VicMapFeatures` folder and replace the `PoziMapServerFastCgi` with `'PoziMapServerNextVicMapFeaturesFastCgi` -- please note that this handler name has to be unique which is why we are replacing it:

```
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.webServer>
        <handlers>
            <add name="PoziMapServerNextVicMapFeaturesFastCgi" path="*" verb="*" type="" modules="FastCgiModule" scriptProcessor="C:\Program Files (x86)\Pozi\server\Vendor\GDAL\bin\ms\apps\mapserv.exe"
            resourceType="Unspecified" requireAccess="Script" allowPathInfo="false" preCondition=""  />
        </handlers>
        <caching enabled="true" enableKernelCache="true" />
    </system.webServer>
</configuration>
```

Below we are going to create another application pool that we are going to set the `MAP` environment variable for:

```
"%systemroot%\system32\inetsrv\appcmd" add app /site.name:"Default Web Site" /path:/Pozi/MapServer/Next/VicMapFeatures /physicalPath:"C:\Program Files (x86)\Pozi\server\iis\Pozi\MapServer\Next\VicMapFeatures"

"%systemroot%\system32\inetsrv\appcmd.exe" add apppool /name:"PoziMapServerNextVicMapFeatures"
"%systemroot%\system32\inetsrv\appcmd.exe" set app "Default Web Site/Pozi/MapServer/Next/VicMapFeatures" /applicationPool:"PoziMapServerNextVicMapFeatures"

"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.applicationHost/applicationPools /+"[name='PoziMapServerNextVicMapFeatures'].recycling.periodicRestart.schedule.[value='02:00:00']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set apppool "PoziMapServerNextVicMapFeatures" /recycling.periodicRestart.time:00:00:00
"%systemroot%\system32\inetsrv\appcmd.exe" set apppool "PoziMapServerNextVicMapFeatures" /processModel.idleTimeout:00:00:00
"%systemroot%\system32\inetsrv\appcmd.exe" set apppool "PoziMapServerNextVicMapFeatures" /startMode:AlwaysRunning
"%systemroot%\system32\inetsrv\appcmd.exe" set app "Default Web Site/Pozi/MapServer/Next/VicMapFeatures" /preloadEnabled:true

"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.applicationHost/applicationPools /+"[name='PoziMapServerNextVicMapFeatures'].environmentVariables.[name='MS_MAPFILE',value='C:\Program Files (x86)\Pozi\server\data\local\sample\queenscliffe\vmfeat_iis_clean.map']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.applicationHost/applicationPools /+"[name='PoziMapServerNextVicMapFeatures'].environmentVariables.[name='MS_MAP_NO_PATH',value='TRUE']" /commit:apphost
```

And now MapServer should respond to query for that `MS_MAPFILE` without including it in URL and will not allow passing the `MAP` environment variable in the query string:

http://local.pozi.com:3001/iis/mapserver/next/vicmapfeatures?service=WMS&request=GetCapabilities
