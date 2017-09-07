#!/bin/sh
bin/rake db:create db:migrate
bundle exec rspec
