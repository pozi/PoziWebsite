---
route: /eg
description: Example page element snippets for working with the Pozi website
visibility: hidden
---

#

<div style="text-align:center;">
  <h1>Examples</h1>
  <img src="/static/img/undraw/undraw_options_re_9vxh.svg" style="width:300px">
</div>

<br/>

## Text

Standard | <big>Big</big> | <small>Small</small>

[!ref icon="plug" text="Reference link"](/admin-guide/integrations/)

## Layout

==- Collapsed by default
Cool
=== Expanded by default
Yeah
===

<details>
<summary>Click to expand</summary>
Expanded!
</details>

<!-- Line break -->
<br/>

<!-- Hard line break -->
<br clear="all" />

### Notes

!!! Generic note

blah

!!!

!!!warning Important

Danger blah

!!!

---

## Icons

https://primer.github.io/octicons/

## Images

### Caption

![Pozi displays a flood model map which is dynamically rendered by QGIS from a CSV file of spot heights](/static/img/screenshots/swan-hill-flood-model-map-from-csv.png)

### Control Position and Size

![](/static/img/undraw/undraw_interview_re_e5jn.svg"){style="width:300px"}

<img src="/static/img/undraw/undraw_interview_re_e5jn.svg" alt="" style="float:right;width:200px;margin:0px 40px;">

<br clear="all" />

## Code

```xml !#2-6 C:\Program Files (x86)\Pozi\server\iis\Pozi\QgisServer\web.config
<system.webServer>
    <security>
        <requestFiltering>
            <requestLimits maxQueryString="32768"/>
        </requestFiltering>
    </security>
</system.webServer>
```

## Reference

### Writing

* https://developers.google.com/tech-writing
* https://www.gingersoftware.com/products/sentence-rephraser

### Structure

https://documentation.divio.com/
