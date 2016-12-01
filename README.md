# Wax Poetic API

A [JSONAPI][] for the Wax Poetic Records roster. Powers the main
http://www.waxpoeticrecords.com/ site as well as artist sites such as
http://www.thewonderbars.com/ and http://www.rndnbass.com/.

## Features

* Management of artist roster and release catalog
* Custom top-level pages for handwritten content
* Blogging system for posting and promoting new articles
* Comments system for the blog articles
* Open and documented [JSONAPI][] for artist sites

## Requirements

To develop on this application, please make sure you have [Docker][]
installed. You can install either Docker for Mac (on macOS) or if you
run any other system, the Docker Toolbox.

## Setup

Clone this repository:

```bash
$ git clone https://github.com/waxpoetic/api.git
```

Install services:

```bash
$ docker-compose up
```

Make requests to <http://waxpoetic.docker> and ensure the seed artist
gets returned:

```bash
$ curl http://waxpoetic.docker/artists.json
{"artists":[{"id": 1,"name":"Sample Artist","bio":"Sample Bio","photo":"https://cdn.waxpoeticrecords.com/...","createdAt": "<DATE>","updatedAt": "<DATE>"}]}
```

## Architecture

At its core, the application is designed around providing its data to
the 

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
