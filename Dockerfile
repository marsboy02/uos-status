FROM ruby:3.0-bullseye as base

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /docker/app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . /docker/app

ENV PORT 3000

EXPOSE $(PORT)

CMD ["bundle","exec", "puma", "config.ru"]

CMD ["rails","server"]