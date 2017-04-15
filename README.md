# Wax Poetic API

This is the public API for Wax Poetic Records, a record label
specializing in soulful electronic music. It wraps a database that
contains our system of record for the entire business, and this API
provides the public representations of those records for both public and
private use.

Currently, the API is being used to power [the catalog site][] as well
as [sites for individual artists][].

## Getting Started



## Requirements

Make sure you have [Ruby 2.3.1][] and [PostgreSQL 9][] installed before
proceeding.

## Setup

Clone this repository:

```bash
$ git clone https://github.com/waxpoetic/api.git waxpoetic-api
$ cd waxpoetic-api
```

Install services:

```bash
$ ./bin/setup
```

Start the server:

```bash
$ ./bin/rails server
```

Make requests to <http://localhost:3000/artists.json>. Here's what gets returned:

```json
{"data":[{"id": 1,"attributes":{"name":"Sample Artist","bio":"Sample Bio","photo":"https://cdn.waxpoeticrecords.com/...","createdAt": "<DATE>","updatedAt": "<DATE>"}}]}
```

To view the admin panel, log in to <http://localhost:3000/admin> with
the configured `:admin_username` and `:admin_password` from
**config/secrets.yml**.
