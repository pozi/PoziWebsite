---
icon: location
---

# Map Widget

*Available for Pozi Pro, Enterprise and Enterprise Cloud customers*

The Pozi map widget enables users to search any address to launch an instance of the Pozi web application focussed on the address location.

==- Example map widget

*Type '3 Queen Street' to try it out.*

<iframe height="200px" width="100%" overflow="hidden" src="https://southerngrampians.pozi.com/widget.html#newtab=true"></iframe>

==-


```html Example iframe embed code
<iframe height="200px" width="100%" overflow="hidden" src="https://southerngrampians.pozi.com/widget.html#newtab=true"></iframe>
```

## Options

### Redirect

If this parameter is added, the current page will be redirected to the Pozi map zoomed to the address.

`reditect=true`

### New Tab

If this parameter is added, the Pozi map will be loaded in a new tab zoomed to the address. Note this option can have issues with browser security such as the built in popup blockers, in particular in IE and Firefox. Whilst the user can change the settings in their browser to allow popups, depending on the expected customer, it may be more appropriate to avoid using the Newtab parameter and live with the downside of having the Pozi map load in the same tab as the address search was performed.

`newtab=true`
