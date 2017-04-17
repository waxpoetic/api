# Welcome to the Wax Poetic API!

<hr />

This is the [JSON API][] for all publically-available Wax Poetic
Records content, including [releases][], [blog articles][], and the
[artist roster][]. It does not currently employ authorization, but some
resources will in the future be protected (none that are currently
documented).

## Schema

The Wax Poetic API employs the [JSON API][] **v1.0.0** standard, and
thus uses the MIME type of `application/vnd.api+json`. We encourage you
to use this in the `Accept` when you make requests to the API.

    Accept: application/vnd.api+json

Additionally, all API resources are accessed over HTTPS. All data is
sent and received as JSON.

There are multiple kinds of responses you can receive with this API:

### Summary Representations

This representation of data is typically served when the client requests
a collection of data, like

    GET /releases

Summaries of data are just the attributes for a given object, and
typically includes just enough identifiable information for the object
to be distinct in the response.

### Detail Representations

Details are returned back to the client when a singleton resource is
accessed.

    GET /releases/1

The details view includes additional information such as relationship
links and full attributes.

## Parameters

Any parameters not passed into `GET` requests that aren't explicitly
part of the route can be passed as query parameters on the end of the
request. For all other requests, parameters must be sent along in JSON
body.

## Client Errors

- Sending invalid JSON results in a `400 Bad Request` response.
- Sending the wrong type of JSON results in a `400 Bad Request` response.
- Sending invalid fields results in a `422 Unprocessable Entity` response.

[JSON API]: http://jsonapi.org
[releases]: /1.0/releases.html
[blog articles]: /1.0/articles.html
[artist roster]: /1.0/artists.html
