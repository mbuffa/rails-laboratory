#!/bin/sh
sleep 10
bin/rake db:create db:migrate
bundle exec rspec
