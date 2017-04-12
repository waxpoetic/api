# Wax Poetic Records API

Welcome to the API documentation for Wax Poetic Records. This API
surrounds our central database, which encompasses information on the
entire Wax Poetic catalog. In addition, we use this API to power the
backend for the marketing sites [WaxPoeticRecords.com][],
[TheWonderBars.com][], [RnDnBass.com][], and others.

## Format

This API follows the [JSONAPI v1.0.0][] specification. We use the
`application/vnd.api+json` MIME type for all requests. Headers must look
like the following:

```
Content-Type: application/vnd.api+json; charset=utf-8
Accept: application/vnd.api+json
```

## Table of Contents

- [Artists](/docs/artists)
- [Releases](/docs/releases)
- [Events](/docs/events)
- [Articles](/docs/articles)
