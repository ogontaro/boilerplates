#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo "Container start"

ruby -v
rm -f tmp/pids/server.pid
rm -f tmp/pids/sidekiq.pid
bundle install -j4 --quiet
bundle exec rails db:schema:dump
bundle exec rails db:seed
bundle exec rails db:setup RAILS_ENV=test
exec "$@"

echo "Container finished"
