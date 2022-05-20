---
title: Community Consultation
order: 50
---

*Community consultation is available for **Pozi Pro**, **Enterprise** and **Enterprise Cloud** offerings.*

Community consultation enables gathering information from the public for strategic initiatives.

A campaign may make use of one or both of these forms:

* main 'survey' form, displayed to user when they click a certain location
* 'feedback' form, displayed when user clicks on a feature (such as another user's survey response)

## Create Survey Form

Log in to [Jotform](https://www.jotform.com/myforms).

### *Updated: use new Template form*

There is now a template that can be cloned for creating new forms:

[https://www.jotform.com/build/211461449813859](https://www.jotform.com/build/211461449813859)

This will eliminate the a lot of the instructions below.

*To do: create another template for feedback*

### Build

Create form, and give it a user-friendly name. In the main Jotform menu, use the "More" options to rename it to [client name]: [project].
 
Add form elements to build the form according to customer spec.

Add hidden fields:

* `Longitude` (Basic > Number)
* `Latitude` (Basic > Number)
* `Layer ID` (Basic > Short Text, with default value, eg, `growinggreatwestern`) (Does this even need to be populated? It looks like Pozi inserts the value. Try testing the next one with just a blank field)
* `Feature ID` (Widget > Unique ID)
* `Map Link` (Basic > Short Text)

Double-check that the fields are named exactly as above.

### Settings

Settings > Emails > (Add client email address as new recipient)

Settings > Conditions > Update/Calculate Field:

* IF: Feature ID
* STATE: Is Filled
* DO: Calculate a field's value

Paste the following, one line at a time into expression box, substituting the items in square brackets with clicking the Insert Field button:

```
https://horsham.pozi.com/#/x%5B
[Longitude]
%5D/y%5B
[Latitude]
%5D/z%5B18%5D/feature%5B
[Layer ID]
,
[Feature ID]
%5D/layers%5B
[Layer ID]
%5D/tab%5Binfo%5D/
```
*Not fully tested*

* SUMMARY: Map Link

### Publish

Publish, and take note of the form id (eg https://form.jotform.co/90516729211858)

## Create Feedback form

The feedback form is an option that allows users to comment and/or like existing features in a Pozi layer. The layer may be a dedicated set of features for which the client wants feedback, or it can be a layer of other user submissions.

* clone an existing feedback form from another client.
* rename to [Client] Feedback
* remove existing email recipients (or replace with new recipient)
* Settings > Conditions > Update/Calculate Field > (update Map Link URL)
* take note of form id (eg https://form.jotform.co/90518613811858)

## Configuring in Pozi

The existing Pozi Admin Panel does NOT currently properly support the necessary `fragment` configuration items.

The configuration must instead be done manually at the *site* level instead of the usual *dataset* level.

1. Admin Panel > Copy config to clipboard
2. paste into desktop text editor
3. add/remove/update dataset `fragments` for the dataset
4. select all, copy to clipboard
5. Admin Panel > Paste config from clipboard
6. test
7. publish

### Examples

* [Add Survey form to Pozi as layer](https://github.com/Pozi/PoziApp/commit/d9098f244ae9ce34622c84d07b226f3241d787f3)
* [Add Feedback form fragments to layer](https://github.com/Pozi/PoziApp/commit/9a13722c3cab269ba6b74c9ae8a6fb7addda0ca6)
* [Disable Feedback form](https://github.com/pozi/PoziAppConfig/commit/3afdb9ebe250ff32e1cd30f44f23a446ee1cb8f4)
