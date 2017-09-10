# TODO: Pick ubuntu:14.04
FROM ruby:2.4

# APT doesn't seem to come with its https driver...
RUN apt-get update && apt-get install apt-transport-https

# Needed for yarn on debian stable (jessie).
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Needed to grab a recent version of nodejs.
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

# Sadly, we need to update again since we added repos.
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
      nodejs \
      yarn \
      libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
