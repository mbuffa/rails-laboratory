# TODO: Pick ubuntu:14.04
FROM ruby:2.4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      nodejs \
      libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000