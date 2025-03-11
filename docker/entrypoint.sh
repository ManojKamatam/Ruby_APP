#!/bin/bash
set -e

# Remove any existing server.pid file
rm -f /app/tmp/pids/server.pid

# Load logger before starting the application
echo "require 'logger'" > /app/config/initializers/logger.rb

# Then exec the container's main process
exec "$@"
