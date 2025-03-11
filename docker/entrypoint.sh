#!/bin/bash
set -e

# Remove any existing server.pid file
rm -f /app/tmp/pids/server.pid

# Run database migrations
bundle exec rails db:migrate

# Then exec the container's main process
exec "$@"
