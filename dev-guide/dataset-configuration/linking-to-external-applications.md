---
---

# Linking to External Applications

## Web Links

### CouncilWise

Using Vicmap Property as the parent:

```json
    "transformer": {
      "calculatedField": {
        "title": "COUNCILWISE PROPERTY ENQUIRY",
        "field": "PROP_PROPNUM",
        "value": "https://apps.councilwise.com.au/Module/Property/Details?filter=Property%20Number={field}"
      }
```
