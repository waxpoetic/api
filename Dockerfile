FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -yy libpq-dev nodejs

RUN mkdir -p /var/www
WORKDIR /var/www
ADD . /var/www

RUN ./bin/setup
