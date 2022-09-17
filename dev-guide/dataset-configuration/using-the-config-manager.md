---
---

# Using the Config Manager

## Dataset Ordering

Dataset ordering affects the order in which they appear in the Layer Panel as well as the order of results in the Info Panel.

To ensure that WMS GetFeatureInfo results appear at the top of the Info Panel, move all "Whats Here" layers down below any layers that might be queryable via WMS GetFeatureInfo. Other datasets that don't have groups (such as searches) should also be moved down to prevent these "groupless" layers appearing above any queryable layers.

However the child datasets of the Property layer don't seem to respect the order in which they are specified in the config.

## Troubleshooting

==- The login page doesn't respond after entering credentials

Click the "Forgot your password" link to force the page to respond. Return to the login page and try logging in again.

==-
