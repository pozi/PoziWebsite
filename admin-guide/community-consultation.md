---
title: Community Consultation
order: 0
tags: [Pozi Pro]
icon: comment-discussion
---

Pozi's Community Consultation feature is used by clients to gather feedback from the community.

Read case studies [here](/tags/community-consultation).

## Examples

==- Glen Eira - Urban Forest Strategy

<iframe width="100%" height="500px" frameborder="0" scrolling="no" allow="fullscreen" src="https://gleneira.pozi.com/#/layers[urbanforeststrategy]/"></iframe>


==- Wangaratta - Walking and Cycling Strategy (display only)

<iframe width="100%" height="500px" frameborder="0" scrolling="no" allow="fullscreen" src="https://wangaratta.pozi.com/#/layers[walkingcyclingstrategycommunityinput]/"></iframe>

==- Horsham - Open Space Strategy (display only)

<iframe width="100%" height="500px" frameborder="0" scrolling="no" allow="fullscreen" src="https://horsham.pozi.com/#/layers[openspacestrategy]/"></iframe>

==-

## How it works

Third-party forms can be embedded into the Pozi app using an iframe. When the user selects a map feature or location on the map, Pozi activates the form and populates the map's coordinates and/or ids of selected features into hidden fields within the form using the parameters in the iframe URL.

User workflow:

* user visits a customised Pozi site (or visits a webpage in which the customised Pozi is embedded)
* Pozi displays a button that invites users to click and select a location on the map
* when user uses the button to select the location, Pozi activates an iframe in the Pozi info panel
* the iframe URL requests the form and populates specific hidden fields in the form with coordinates of the clicked location and/or the id of a selected feature
* the user completes the form and clicks the submit button

The third-party form must enable hidden fields within the form to be populated using URL parameters. Pozi is compatible with the following form providers:

* Jotform
* Google Form

Do you use another form service? Let us know, and we'll see if it's compatible.

## Content Moderation

Every user submission is automatically emailed to an email address of your choosing. If you receive any off-topic or unwanted submissions, you'll be able to log in to the forms API and delete any submissions.
