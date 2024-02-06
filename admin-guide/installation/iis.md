---
order: 88
---

# IIS

## Install IIS

!!!secondary Copying and pasting using command prompt

When copying and pasting multiple lines into the command prompt, all lines will be executed except the last one. You must hit `Enter` for the last line to be executed.

!!!

In a new command prompt window, running as administrator:

```cmd
dism /online /enable-feature /featurename:IIS-WebServerRole
dism /online /enable-feature /featurename:IIS-WebServer
dism /online /enable-feature /featurename:IIS-ApplicationDevelopment
dism /online /enable-feature /featurename:IIS-ApplicationInit
dism /Online /Enable-Feature /FeatureName:IIS-CGI

```

If IIS has not previously been set up on the server, the command prompt may return `Restart Windows to complete this operation`.  Restarting may be necessary for the subsequent configuration.

## Create backup

Before continuing or making any changes in the future, it may be a good idea to create a backup.

Execute the following command for creating a backup:

'''
"%systemroot%\system32\inetsrv\appcmd" add backup
'''

The most relevant files are:

```%windir%\System32\inetsrv\config\applicationHost.config```

and

```C:\Pozi\IIS\QgisServer\web.config```

It may be worth creating a manual backup of these files too, in order to see what changes have been made to these files.

## Prepare Folders

- create folder path: `C:\Pozi\IIS\QgisServer`
- create `web.config` file at this location with the following content

```xml C:\Pozi\IIS\QgisServer\web.config
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <system.webServer>
        <handlers>
            <add name="PoziQgisServerFastCgi" path="*" verb="*" type="" modules="FastCgiModule" scriptProcessor="C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe"
            resourceType="Unspecified" requireAccess="Script" allowPathInfo="false" preCondition="" responseBufferLimit="4000000000" />
        </handlers>
        <security>
            <requestFiltering>
                <requestLimits maxQueryString="32768"/>
            </requestFiltering>
        </security>
        <caching enabled="true" enableKernelCache="true" />
    </system.webServer>
</configuration>
```

NOTE: If you have installed QGIS Server to a location other than the default `C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe` then you will need to update that path in the `web.config` file. You'll also need to make the necessary substitutions in many of the commands below.

### Background information:

* [FastCGI](https://learn.microsoft.com/en-us/iis/configuration/system.webserver/fastcgi/)

## Configure IIS

```cmd
"%systemroot%\system32\inetsrv\appcmd" add app /site.name:"Default Web Site" /path:/Pozi /physicalPath:"C:\Pozi\IIS"
"%systemroot%\system32\inetsrv\appcmd" add app /site.name:"Default Web Site" /path:/Pozi/QgisServer /physicalPath:"C:\Pozi\IIS\QgisServer"

```

If the command prompt returns `"C:\Windows\system32\inetsrv\appcmd" is not recognised as an internal or external command`, then a restart may be required before re-attempting this configuration step.

```cmd
%windir%\system32\inetsrv\appcmd.exe unlock config -section:system.webServer/handlers

"%systemroot%\system32\inetsrv\appcmd" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe',idleTimeout='604800',maxInstances='5',activityTimeout='70',requestTimeout='120']" /commit:apphost

"%systemroot%\system32\inetsrv\appcmd" set config /section:isapiCgiRestriction /+"[path='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe',description='PoziQgisServer',allowed='True']"
```

**Tip**: if a fastCGI request frequently times out due to a slow database connection or very large datasets, change the `requestTimeout` value to a greater number (in seconds).

## Configure Environment Variables

+++ Command Prompt

Copy and paste the following into the command prompt:

```cmd
:: Clear any potentially pre-existing env vars (handy when doing upgrades)
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /-"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables

:: Set env vars

:: The PATH variable required
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='PATH',value='C:\OSGeo4W\apps\qgis-ltr\bin;C:\OSGeo4W\apps\qt5\bin;C:\OSGeo4W\bin;C:\Windows\system32;C:\Windows;C:\Windows\system32\WBem']" /commit:apphost

:: The following env vars may be optional
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='O4W_QT_PREFIX',value='C:\OSGeo4W\apps\Qt5']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='O4W_QT_BINARIES',value='C:\OSGeo4W\apps\Qt5\bin']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='O4W_QT_PLUGINS',value='C:\OSGeo4W\apps\Qt5\plugins']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='O4W_QT_LIBRARIES',value='C:\OSGeo4W\apps\Qt5\lib']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='O4W_QT_TRANSLATIONS',value='C:\OSGeo4W\apps\Qt5\translations']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='O4W_QT_HEADERS',value='C:\OSGeo4W\apps\Qt5\include']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='QGIS_PREFIX_PATH',value='C:\OSGeo4W\apps\qgis-ltr']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='QT_PLUGIN_PATH',value='C:\OSGeo4W\apps\qt5\plugins']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='TEMP',value='C:\Windows\Temp']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='PYTHONHOME',value='C:\OSGeo4W\apps\Python39']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='QGIS_SERVER_IGNORE_BAD_LAYERS',value='1']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='QGIS_SERVER_LOG_FILE',value='C:\Pozi\IIS\QgisServer\qgis_server.log']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='QGIS_SERVER_LOG_LEVEL',value='1']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='QGIS_PLUGINPATH',value='C:\OSGeo4W\apps\qgis-ltr\plugins']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='GDAL_DRIVER_PATH',value='C:\OSGeo4W\apps\gdal\lib\gdalplugins']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='GDAL_DATA',value='C:\OSGeo4W\apps\gdal\share\gdal']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='PYTHONPATH',value='C:\OSGeo4W\apps\qgis-ltr\python']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='PROJ_LIB',value='C:\OSGeo4W\share\proj']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/fastCgi /+"[fullPath='C:\OSGeo4W\apps\qgis-ltr\bin\qgis_mapserv.fcgi.exe'].environmentVariables.[name='DEBUG_WFSOUTPUTEXTENSION',value='1']" /commit:apphost

```

+++ Manual Configuration

If the command prompt option doesn't work, you can configure the environment variables manually.

![FastCGI Settings](./img/pozi-qgis-server-iis.png)

Windows > IIS > select server > Fast CGISettings > select `qgis_mapserv.fcgi.exe` application > Edit > Environment variables:

Name | Value
-----|------
PATH | `C:\OSGeo4W\apps\qgis-ltr\bin;C:\OSGeo4W\apps\qt5\bin;C:\OSGeo4W\bin;C:\Windows\system32;C:\Windows;C:\Windows\system32\WBem`
O4W_QT_PREFIX | `C:\OSGeo4W\apps\Qt5`
O4W_QT_BINARIES | `C:\OSGeo4W\apps\Qt5\bin`
O4W_QT_PLUGINS | `C:\OSGeo4W\apps\Qt5\plugins`
O4W_QT_LIBRARIES | `C:\OSGeo4W\apps\Qt5\lib`
O4W_QT_TRANSLATIONS | `C:\OSGeo4W\apps\Qt5\translations`
O4W_QT_HEADERS | `C:\OSGeo4W\apps\Qt5\include`
QGIS_PREFIX_PATH | `C:\OSGeo4W\apps\qgis-ltr`
QT_PLUGIN_PATH | `C:\OSGeo4W\apps\qt5\plugins`
TEMP | `C:\Windows\Temp`
PYTHONHOME | `C:\OSGeo4W\apps\Python39`
QGIS_SERVER_IGNORE_BAD_LAYERS | `1`
QGIS_SERVER_LOG_FILE | `C:\Pozi\IIS\QgisServer\qgis_server.log`
QGIS_SERVER_LOG_LEVEL | `1`
QGIS_PLUGINPATH | `C:\OSGeo4W\apps\qgis-ltr\plugins`
GDAL_DRIVER_PATH | `C:\OSGeo4W\apps\gdal\lib\gdalplugins`
GDAL_DATA | `C:\OSGeo4W\apps\gdal\share\gdal`
PYTHONPATH | `C:\OSGeo4W\apps\qgis-ltr\python`
PROJ_LIB | `C:\OSGeo4W\share\proj`
DEBUG_WFSOUTPUTEXTENSION | `1`

(End of `Manual Configuration` instructions)

+++

!!! Log Levels

The above script/instructions sets the `QGIS_SERVER_LOG_LEVEL` value to `1` to capture warnings and critical events in the log. If you want to capture *all* activity for troubleshooting purposes, set the value to `0` in the GUI.

More information about QGIS log levels is at https://docs.qgis.org/latest/en/docs/server_manual/config.html#qgis-server-log-level

!!!

## Application Pool

Create PoziQgisServer application pool:

```cmd
"%systemroot%\system32\inetsrv\appcmd.exe" add apppool /name:"PoziQgisServer"
"%systemroot%\system32\inetsrv\appcmd.exe" set app "Default Web Site/Pozi/QgisServer" /applicationPool:"PoziQgisServer"
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.applicationHost/applicationPools /+"[name='PoziQgisServer'].recycling.periodicRestart.schedule.[value='02:00:00']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set apppool "PoziQgisServer" /recycling.periodicRestart.time:00:00:00
"%systemroot%\system32\inetsrv\appcmd.exe" set apppool "PoziQgisServer" /processModel.idleTimeout:00:00:00
"%systemroot%\system32\inetsrv\appcmd.exe" set apppool "PoziQgisServer" /startMode:AlwaysRunning
"%systemroot%\system32\inetsrv\appcmd.exe" set app "Default Web Site/Pozi/QgisServer" /preloadEnabled:true

```

## Permissions

Set permissions for `IIS AppPool\PoziQgisServer` :

IIS > select server > Application Pools > PoziQgisServer > Advanced settings > Identity > Application Pool Identity > Custom account > enter details of the domain user that runs Pozi "service" account (include the domain prefix and backslash, or use the email address of the domain user)

## Testing

Construct a WMS GetProjectSettings request for any existing QGIS project file as follows:

```
http://localhost/pozi/qgisserver?service=WMS&map=C:/Projects/SomeProject.qgs&request=GetProjectSettings
```

Substitute `C:/Projects/SomeProject.qgs` with the file path of an actual QGIS project file. Any backslashes in the path must be replaced with forward slashes.

Enter the constructed URL into the address bar of your browser, hit Enter, and you should see an XML file that describes the data endpoints for the project's layers.

<br/>

---

## Dynamic Compression

:::note Under Construction

*This section is a work in progress. Please get in touch with us before following any of the steps below*

:::

Enable the Dynamic Compression IIS module:

```bat
dism /online /Enable-Feature /FeatureName:IIS-HttpCompressionDynamic
```

Configure `applicationHost.config`, section `configuration.system.webServer` the following way by replacing `<httpCompression />` with:

```xml %windir%\System32\inetsrv\config\applicationHost.config
	    <httpCompression
            doDiskSpaceLimiting="true"
            maxDiskSpaceUsage="2000"
            noCompressionForProxies="false"
            staticCompressionIgnoreHitFrequency="true"
            dynamicCompressionDisableCpuUsage="100"
            dynamicCompressionEnableCpuUsage="100"
            dynamicCompressionBufferLimit="4255360000"
            cacheControlHeader="max-age=10"
            sendCacheHeaders="false"
        >

            <!--
            <scheme name="br" dll="%ProgramFiles%\IIS\IIS Compression\iisbrotli.dll" />
            <scheme name="gzip" dll="%ProgramFiles%\IIS\IIS Compression\iiszlib.dll" />
            -->

            <staticTypes>
				<add mimeType="*/*spreadsheet*" enabled="false" />

				<add mimeType="*/*xml*" enabled="true" />
				<add mimeType="*/*svg*" enabled="true" />

				<add mimeType="image/*" enabled="false" />
				<add mimeType="*/*zip*" enabled="false" />

				<add mimeType="*/*" enabled="true" />
            </staticTypes>

            <dynamicTypes>
				<add mimeType="*/*spreadsheet*" enabled="false" />

				<add mimeType="*/*xml*" enabled="true" />
				<add mimeType="*/*svg*" enabled="true" />

				<add mimeType="image/*" enabled="false" />
				<add mimeType="*/*zip*" enabled="false" />

				<add mimeType="*/*" enabled="true" />
                <add mimeType="application/msword" enabled="true" />
            </dynamicTypes>
        </httpCompression>
```

The above can be achieved by executing the following commands:

```bat
:: Configure httpCompression settings
:: "%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /directory:"%SystemDrive%\inetpub\temp\IIS Temporary Compressed Files" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /doDiskSpaceLimiting:true /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /maxDiskSpaceUsage:2000 /commit:apphost & :: in megabytes
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /noCompressionForProxies:false  /commit:apphost &:: VERY IMPORTANT, otherwise compression will be disable for Cloudfront/App Proxy
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /staticCompressionIgnoreHitFrequency:true  /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /dynamicCompressionDisableCpuUsage:100 /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /dynamicCompressionEnableCpuUsage:100 /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /dynamicCompressionBufferLimit:4255360000 /commit:apphost &:: VERY IMPORTANT for caching/compressing large results. In bytes.
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /cacheControlHeader:"max-age=60" & :: in seconds
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /sendCacheHeaders:false & :: if true, this will allow for browser side disk caching

:: Add Brotli scheme (should not need to be added)
:: "%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"[name='br',dll='%ProgramFiles%\IIS\IIS Compression\iisbrotli.dll']" /commit:apphost

:: Add Gzip scheme (should not need to be added)
:: "%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"[name='gzip',dll='%ProgramFiles%\IIS\IIS Compression\iiszlib.dll']" /commit:apphost

:: Configure staticTypes
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"staticTypes.[mimeType='*/*spreadsheet*',enabled='false']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"staticTypes.[mimeType='*/*xml*',enabled='true']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"staticTypes.[mimeType='*/*svg*',enabled='true']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"staticTypes.[mimeType='image/*',enabled='false']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"staticTypes.[mimeType='*/*zip*',enabled='false']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"staticTypes.[mimeType='*/*',enabled='true']" /commit:apphost

:: Configure dynamicTypes
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"dynamicTypes.[mimeType='*/*spreadsheet*',enabled='false']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"dynamicTypes.[mimeType='*/*xml*',enabled='true']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"dynamicTypes.[mimeType='*/*svg*',enabled='true']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"dynamicTypes.[mimeType='image/*',enabled='false']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"dynamicTypes.[mimeType='*/*zip*',enabled='false']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"dynamicTypes.[mimeType='*/*',enabled='true']" /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/httpCompression /+"dynamicTypes.[mimeType='application/msword',enabled='True']" /commit:apphost

:: Enable urlCompression
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:urlCompression /doStaticCompression:true /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:urlCompression /doDynamicCompression:true /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:urlCompression /dynamicCompressionBeforeCache:true /commit:apphost

```

Note:

* `maxDiskSpaceUsage`: size is in MB
* `noCompressionForProxies:false`: If this value is set to `true`, IIS will not compress if it detects that the request has come through a proxy. Cloudfront and Azure/Entra Id App Proxy
  fall in that category, so it's important to set this value to `false`.
* `dynamicCompressionBufferLimit`: this value (size in bytes) determines the maximum uncompressed response size before deciding not to compress the result. It has been observed in some IIS
  instances that when the size gets above 30MB, the response throughput becomes progressively slower as the size increases.
* `dynamicCompressionBeforeCache:true` has a limit of about 15MB uncompressed or 5MB compressed (on a server with 1GB memory). Any response that is bigger than that will disable compression.
  If the value is set to `false`, the response will always be compressed but not cached (if caching is enabled below). The optimal setting of this depends on
  the capabilities of the server that IIS resides on or the speed of the network connection and may need to be assessed on a case by case basis.
* `cacheControlHeader`: `max-age` value is in seconds
* `sendCacheHeaders`: if set to true, the browser will cache the contents for up to the value of `max-age` in the `cacheControlHeader` attribute

**Also note**: the settings above affect all sites running on IIS. If this is problematic, move the settings to the `C:\Pozi\IIS\QgisServer\web.config` file.
It may be necessary to change some settings in `applicationHost.config` to allow for this to happen.

**TODO: determine if the following is needed:**

In `web.config`, make sure that the following `responseBufferLimit="4000000000"` is set in the `PoziQgisServerFastCgi` handler:

```xml C:\Pozi\IIS\QgisServer\web.config
        <handlers>
            <add name="PoziQgisServerFastCgi" .... responseBufferLimit="4000000000" />
```

## Caching

:::note Under Construction

*This section is a work in progress. Please get in touch with us before following any of the steps below*

:::

Enable caching from the first time a document is being requested in section `configuration.system.webServer`:

```xml C:\Pozi\IIS\QgisServer\web.config
        <serverRuntime frequentHitThreshold="1" frequentHitTimePeriod="00:10:00" />

        <caching enabled="true" enableKernelCache="true" maxCacheSize="2000" maxResponseSize="4120000000" />
```

**Command-line**:

```bat
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/serverRuntime /frequentHitThreshold:1 /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/serverRuntime /frequentHitTimePeriod:"00:10:00" /commit:apphost
```

```bat
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/caching /enabled:true /commit:apphost
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/caching /enableKernelCache:false /commit:apphost & :: set to false to prevent frequent clearing of cache
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/caching /maxCacheSize:2000 /commit:apphost & :: can only be set here (size in megabytes)
"%systemroot%\system32\inetsrv\appcmd.exe" set config -section:system.webServer/caching /maxResponseSize:4120000000 /commit:apphost & :: can only be set here (size in bytes)
```


Add to the `C:\Pozi\IIS\QgisServer\web.config` in section `configuration.system.webServer`:

```xml C:\Pozi\IIS\QgisServer\web.config
		<caching enabled="true" enableKernelCache="false">
            <profiles>
                <add extension="*" policy="CacheForTimePeriod" kernelCachePolicy="CacheForTimePeriod" duration="00:10:00" location="Any" varyByQueryString="*" varyByHeaders="Accept-Encoding" />
            </profiles>
        </caching>
```

**Command-line**:

```bat
"%systemroot%\system32\inetsrv\appcmd" set config "Default Web Site/Pozi/QgisServer" -section:system.webServer/caching /enabled:true
"%systemroot%\system32\inetsrv\appcmd" set config "Default Web Site/Pozi/QgisServer" -section:system.webServer/caching /enableKernelCache:false
"%systemroot%\system32\inetsrv\appcmd" set config "Default Web Site/Pozi/QgisServer" -section:system.webServer/caching /+profiles.[extension='*',duration='00:10:00',location='Any',policy='CacheForTimePeriod',kernelCachePolicy='CacheForTimePeriod',varyByQueryString='*',varyByHeaders='Accept-Encoding']
```


This will cache content for up to the time set in the `duration` field. If a longer cache duration is desired, it is recommended to invalidate the cache (see below) every time a QGIS project file
or any of the layers or their contents have changed.

### Cache invalidation

Run the following command to invalidate the cache:

```bat
%windir%\system32\inetsrv\appcmd recycle apppool /apppool.name:PoziQgisServer
```

If the above does not clear the cache for any reason, then execute the following command instead (which will restart IIS):

```bat
iisreset
```

These command can be added to a batch (.bat) file that the user can run. If administrator privileges are required, then, as administrator, create a shortcut
to this file and change its properties to get it to run as administrator.

**Note:**

IIS can choose to periodically clear the cache. This can happen within the space of minutes and it's as of yet unclear how to prevent this from
happening.

### Background information

* [Configure IIS Output Caching](https://learn.microsoft.com/en-us/iis/manage/managing-performance-settings/configure-iis-7-output-caching#select-a-cache-policies)

## Enable debugging (tracing)

:::note Under Construction

*This section is a work in progress. Please get in touch with us before following any of the steps below*

:::

### Tracing
When requests fail or caching/compression does not work, it is recommended to use IIS's tracing functionality to determine the cause if these issues.

First enable tracing for IIS:

```bat
dism /online /Enable-Feature /FeatureName:IIS-HttpTracing
```

Then, in the IIS manager, click on `Default Web Site` and in the `Actions` pane on the right hand side, click on `Failed Request Tracing...` under the `Configure` heading and then check `Enable` and close the window.

Then add the following to `C:\Pozi\IIS\QgisServer\web.config` to enable tracing for all requests in section `configuration.system.webServer`:

```xml C:\Pozi\IIS\QgisServer\web.config
        <tracing>
            <traceFailedRequests>
                <add path="*">
                    <traceAreas>
                        <add provider="WWW Server" areas="Authentication,Security,Filter,StaticFile,CGI,Compression,Cache,RequestNotifications,Module,FastCGI,WebSocket" verbosity="Verbose" />
                    </traceAreas>
                    <failureDefinitions statusCodes="3-999" />
                </add>
            </traceFailedRequests>
        </tracing>
```

The tracing output files can generally be found in:

```bat
%SystemDrive%\inetpub\logs\FailedReqLogFiles
```

When opening the .xml file in Internet Explorer (!), the user gets presented with an interactive web page. The 'Compact View' tab can provide useful information.

It is recommended to turn the feature off by commenting out the code block below when not needed any more.

Relevant events and some of their potential values are:

* `OUTPUT_CACHE_LOOKUP_END`: `Result="FOUND"`, `Result="NOT_FOUND"`, `Result="CACHING_DISABLED"`

More information about tracing failed requests can be found on [Microsoft's website](https://learn.microsoft.com/en-us/iis/configuration/system.applicationhost/sites/site/tracefailedrequestslogging).

### Useful commands

The following PowerShell command provides a list of system events related to Pozi QGIS Server:

```powershell
Get-WinEvent -LogName System | Where-Object {$_.Message -like "*PoziQgisServer*"} | out-host -paging
```

## Restart IIS / Application Pool

Restart IIS:

```bat
iisreset /restart
```

Restart Application pool:

```bat
%windir%\system32\inetsrv\appcmd recycle apppool /apppool.name:PoziQgisServer
```

## Serving Static Files

Pozi can be configured to deliver documents and other content from your network to users within Pozi, either as clickable links or, if the link ends with `.jpg` or `.png`, as embedded images.

As a web application, Pozi can interact only through web URLs and not network file paths.

This section describes how to turn network folders into URLs that Pozi can use to access documents and image files.

### Create Parent Virtual Directory

Configure a top-level virtual folder within Pozi's IIS profile as follows:

IIS > select server > Sites > Default Web Site > Pozi > right-click > Add Virtual Directory

- Alias: `static`
- Physical path: `C:\Pozi\IIS\Static`
- OK

The path specified is not actually important, except if using it for directly storing content.

The purpose of this virtual directory is it creates a `/static` path within Pozi's IIS endpoint under which one or more virtual subdirectories can be configured for various folders on your network.

### Create Subdirectories for Your Content

Create the virtual subdirectories within the new `/static` directory that can point to network folders containing your content.

IIS > select server > Sites > Default Web Site > Pozi > `static` > right-click > Add Virtual Directory

- Alias: name of resource (eg `ConquestDocs`)
- Physical path: path of network folder containing your content

Note: the user account under which IIS application pool is running (typically PoziService or similar) must have read access to the physical path.

![Alt text](img/iis-virtual-directory.png){style="width:700px"}

### Links

When configured as above, any content within the specified folders can be accessed via their corresponding virtual directory.

#### Example File

- Physical file: `\\<networkdrive>\GIS$\Documents\Cavendish\preschool.JPG`

#### Example Links

- Local URL: `http://localhost/pozi/static/ConquestDocs/Cavendish/preschool.JPG`
- Network URL: `http://<servername>/pozi/static/ConquestDocs/Cavendish/preschool.JPG`
- Azure App Proxy URL: `https://<appproxyendpoint>/pozi/static/ConquestDocs/Cavendish/preschool.JPG`

The local and network URLs can be used for testing and troubleshooting purposes.

The Azure App Proxy URL is the link format you'll use for referencing content within your layers.

<br/>

---

## Proxy ogr2ogr from IIS

For clients with the legacy Pozi Server installed, but who are about to implement Azure AD integration, IIS can be configured to proxy requests to existing Pozi Server services (such as `ogr2ogr` required for Unified Search).

This enables IIS to be the default entry point for the Azure App Proxy whilst keeping access to Pozi Server's `ogr2ogr` functionality.

Two pieces of software need to be installed with admin privileges and IIS needs to be configured manually (currently) to make the proxy functionality work.

### Instructions

* Download & install x64 installer for https://www.iis.net/downloads/microsoft/url-rewrite
* Then download & install x64 installer for https://www.iis.net/downloads/microsoft/application-request-routing
* Close and reopen IIS console

### In IIS Home

* Open 'Application Request Routing' icon
* Click on Proxy - Server Proxy Settings
* Check 'Enable Proxy' and hit 'Apply'

Sites > Default Web Site > Pozi

* Open feature 'URL rewrite'
* 'Add rules...' and double-click 'Reverse Proxy'
* Enter server name without http or https in 'Inbound rules'. E.g., enter `local.pozi.com` if that is where PoziServer is running
* OK
* select newly created item, then Inbound Rules - Edit
* Make sure that the values in the new rule match the attached image:
* **Pattern**: `^ogr2ogr(.*)`
* **Rewrite URL**: `https://local.pozi.com/ogr2ogr{R:1}` (make sure to match the `http` or `https` of the original URL)
* Apply
* click Back
* select ReverseProxyInboundR.. > Rename: Pozi Server ogr2ogr

Test: http://localhost/pozi/ogr2ogr

### Example urls

* https://pozicloudserver-teampozi.msappproxy.net/pozi/ogr2ogr?source=sample/queenscliffe/delwp/vmfeat/foi_point.shp

### IIS Virtual Directory

This allows us to serve content from the file system

* Right click on Pozi (in Sites / Default Web Site)
* Click on 'Add Virtual Directory...'
* Fill in the alias field, eg `static`
* Physical path: choose the path in the file system eg `C:\Pozi\IIS\Static`
* Hit OK

---

## Troubleshooting

==- ECW layers are not rendered

Depending on how QGIS has been installed, some dependency paths may vary.

#### `GDAL_DRIVER_PATH`

* GDAL 3.4 and earlier: `C:\OSGeo4W\bin\gdalplugins`
* GDAL 3.5: `C:\OSGeo4W\apps\gdal\lib\gdalplugins`

Update the `GDAL_DRIVER_PATH` environment variable accordingly.

==- QGIS Desktop doesn't open

If you experience an "Error loading QGIS" message, it may specify a file named `qgis-ltr-bin.env` that might not exist in your installation:

> Error loading QGIS
> Oops, looks like an error loading QGIS
>
> Details:
> Could not load qgis_app.dll
> Windows Error: The specified module could not be found.
>
> Help:
> Check C:\OSGeo4W\bin\qgis-ltr-bin.env for correct environment paths

Use a text editor to recreate the missing file with the following content:

```bat C:\OSGeo4W\bin\qgis-ltr-bin.env
PATH=C:\OSGeo4W\apps\qgis-ltr\bin;C:\OSGeo4W\apps\qt5\bin;C:\OSGeo4W\apps\Python39\Scripts;C:\OSGeo4W\bin;C:\Windows\system32;C:\Windows;C:\Windows\system32\WBem
GDAL_DATA=C:\OSGeo4W\apps\gdal\share\gdal
GDAL_DRIVER_PATH=C:\OSGeo4W\apps\gdal\lib\gdalplugins
GDAL_FILENAME_IS_UTF8=YES
JPEGMEM=1000000
OSGEO4W_ROOT=C:\OSGeo4W
PROJ_LIB=C:\OSGeo4W\share\proj
PYTHONHOME=C:\OSGeo4W\apps\Python39
PYTHONUTF8=1
QGIS_PREFIX_PATH=C:/OSGeo4W/apps/qgis-ltr
QT_PLUGIN_PATH=C:\OSGeo4W\apps\qgis-ltr\qtplugins;C:\OSGeo4W\apps\qt5\plugins
VSI_CACHE=TRUE
VSI_CACHE_SIZE=1000000
O4W_QT_PREFIX=C:/OSGeo4W/apps/Qt5
O4W_QT_BINARIES=C:/OSGeo4W/apps/Qt5/bin
O4W_QT_PLUGINS=C:/OSGeo4W/apps/Qt5/plugins
O4W_QT_LIBRARIES=C:/OSGeo4W/apps/Qt5/lib
O4W_QT_TRANSLATIONS=C:/OSGeo4W/apps/Qt5/translations
O4W_QT_HEADERS=C:/OSGeo4W/apps/Qt5/include
QGIS_WIN_APP_NAME=OSGeo4W\QGIS Desktop 3.22.8
```

Check that the `GDAL_DATA` and `GDAL_DRIVER_PATH` paths exist for your installation. If not, update the file accordingly.

If you are denied permission to create or edit the file in the destination location, create the file elsewhere and move it to `C:\OSGeo4W\bin\` using Windows Explorer.

[Further details about this issue](https://github.com/qgis/QGIS/issues/49148#issuecomment-1174459434)

==- IIS seems to "go to sleep"

IIS > select server > Application Pools > PoziQgisServer > Advanced Settings:

* General > Start Mode > `AlwaysRunning`
* Process Model > Idle Time-out (minutes) > `0`
* Recycling > Regular Time Interval (minutes) > `0`

==- Layers that are visible in QGIS appear as blank/empty layers in Pozi

Check that the domain account that is running the IIS application pool (eg PoziService) has the necessary permissions to access the layer source.

Check whether the service account has the right permissions by running QGIS as the service account user. Hold Shift and right-click on the QGIS desktop shortcut, choose 'Run as a different user', then enter the credentials of the service account. Open the QGIS project to which the affected layer(s) belong and check whether you can view the layer.

If the layer(s) are visible in QGIS but still not in Pozi, try updating the following IIS setting:

IIS > Your Server > Application Pools > PoziQgisServer > Advanced Settings > Load User Profile > set to `True`.

Recycle the PoziQgisServer application pool and reload Pozi.

==- QGIS project layer group is visible but can't be expanded

On loading the error message "Something went wrong: layer may be misconfigured. Layer: '[Your QGIS project layer]', type: 'QGISProjectSettings'" appears.

If the layer group for the QGIS project is visible, but cannot be expanded to show the layers within the project, this may be due to a CORS (cross-origin resource sharing) issue.  This is a security precaution that stops a website from drawing content across from another domain name.  In this case the QGIS Server needs to allow the organisation's Pozi site as a trusted content source.

IIS > select server > Site > Default Web Site > Pozi > QgisServer:

* Open feature 'HTTP Response Headers'
* Action 'Add...'
* **Name**: `Access-Control-Allow-Origin`
* **Value**: `https://[sitename].pozi.com`

==-
