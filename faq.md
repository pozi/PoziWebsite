---
layout: central
description: Got a question about Pozi? Here are some FAQs.
---

# Frequently Asked Questions

## User Experience

==- Does Pozi have a mobile app?

Pozi is a web application that runs in any desktop or mobile browser.

Pozi's responsive design enables it to work on any sized device. On large screens, it displays in landscape mode. On smaller screens such as phones, it displays in portrait mode, with the menu displaying under the map.

Pozi uses Progressive Web App (PWA) technology, enabling users to add Pozi to the home screen of their device, launch it and switch between it and other apps as if it were a native application.

==- Is it possible to limit what attributes are shown?

You can configure what fields your users see by using the layer configuration options in QGIS. You can even modify the field names that your users see, as well as create virtual fields to display values derived or calculated from existing fields. This can all be done without modifying your data or setting up views in SQL Server.

==- Does Pozi comply with Web Content Accessibility Guidelines (WCAG)?

Pozi incorporates accessibility best practices. While interactive maps inherently pose challenges in meeting full WCAG 2.2 Level AA compliance. Pozi provides text descriptions for key elements, enables datasets to be downloaded in text formats, and supports high-contrast colour schemes and adjustable zoom levels for better readability.

==-

## Configuration

==- How are Pozi sites configured?

We configure Pozi to suit the specialised needs of our clients. Requests for configuration changes can be lodged with our help desk. All configuration updates are included in the subscription.

Pozi *Enterprise Cloud* clients also have the ability to manage all their internal data connections via QGIS.

==- Can Pozi provide access to external parties for internal datasets?

The Pozi *Enterprise Cloud* solution enables organisations to grant access to internal data to staff and external parties using Entra ID Active Directory.

==- Does Pozi have a testing environment?

The Pozi app has production and staging links that enable clients to preview upcoming enhancements and new features before they are released.

On the client’s side, the client’s production QGIS Server is the single source of truth for its layer configuration. Pozi doesn’t integrate with any non-production QGIS Server for testing or other purposes.

---

## Deployment

==- How long does it take to implement a Pozi site?

We like to allow 3-4 weeks from receipt of a purchase order to a go-live date.

Talk to us about your requirements and priorities, and we can give you a more precise timeline.

==-

## Support

==- How is Pozi supported?

We provide technical support via our helpdesk service to enable you to get the most out of Pozi and solve any technical issues. Email and phone support is included in the subscription.

Email [support@pozi.com](mailto:support@pozi.com) or call 03 9017 6850.

We also partner with specialist GIS support providers who can offer a full range of GIS support services, including Pozi customisation, QGIS training, technical consulting and more.

==-

---

## Platform

==- How is the connection between pozi.com and our server achieved?

There is no connection between pozi.com and your server.

When you open Pozi, your browser fetches the Pozi web application/page from pozi.com. Then depending on what actions you do in the application, your browser may need to fetch map layers and other data from your server, which it does by sending requests (WMS/WFS) through MS App Proxy to your server. There is no Pozi "server" that connects to your server.

==- How does the Pozi platform deal with scalability and security?

Pozi's cloud architecture ensures fast performance, maximum stability, and unlimited scalability.

Pozi is fully hosted and managed on Amazon Web Services (AWS), served from an Australian-based data centre. The application is deployed to AWS Simple Storage Service (S3) and served by AWS CloudFront.

Pozi is fully compliant with https to ensure user privacy and compatibility with all major browsers. Pozi App is encrypted and authenticated using TLS 1.2/1.3, X25519, and AES_128_GCM.

As a serverless web application, Pozi is not vulnerable to server exploits. AWS Cloudfront provides protection from DDOS attacks.

We monitor the uptime of the Pozi application using Pingdom. Pozi maintained a 99.999% uptime over the last three years.

==- Where is Pozi hosted?

The Pozi web application is hosted on our cloud infrastructure on Amazon Web Services.

When the Pozi application loads in a user's browser, it fetches data directly from various public and private data sources to display it in the map.

For any layers you choose to publish to the public, the on-premise Pozi Publisher application synchronises the layers to the Pozi cloud infrastructure where it is accessible by the public.

In the Enterprise Cloud implementation, authenticated users are able to interact directly with the council's on-premise data via Microsoft App Proxy. Your layers and QGIS projects remain onsite.

[!ref icon="stack" text="Learn more"](../how-it-works/)

==- How does Pozi deal with updates and bug fixes?

We embrace continuous development and deployment processes to ensure our clients have access to the latest version. Updated releases which include bug fixes, enhancements and new features are deployed several times per month. Any critical fixes can be deployed in a matter of hours.

==- What applications can be integrated with Pozi?

See our list of some of the applications that Pozi integrates with [here](../admin-guide/integrations/).

==-

---

---

[!ref text="Got more questions? Get in touch!"](/contact/)
