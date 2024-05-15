---
title: Service Monitoring
order: 50
---

* [Pingdom](https://my.pingdom.com/app/newchecks/checks)
* [Freshping](https://pozi.freshping.io/dashboard)

## Public Status Page

* [Public view](http://stats.pingdom.com/w3ggvgl5rino)
* [Settings](https://my.pingdom.com/app/reports/public)
* [Custom Dashboard for Cardinia](https://statuspage.freshping.io/25822-PoziStatusForCardinia)

## Outage Message

![Pingdom outage notification](./img/pingdom-outage-notification.png){style="width:250px"}

Upon loading, Pozi sends a request to Pingdom to determine whether any services are currently down. If so, it will display this message if any of the following services are down:

```js
checks: {
    include: {
    'Data.gov.au Web Map Service': true,
    'DELWP DataVic Web Map Service': true,
    'DELWP Image Web Server': true,
    'Pozi App': true,
    'Vicmap API Map Tile Service': true
    }
}
```

https://github.com/pozi/PoziApp/blob/main/src/utils/pingdom.js#L26-L32

To prevent an unwanted warning from displaying to users (for instance, if a service is experiencing a long outage), change the check's name in Pingdom.
