ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile
require 'logger' # Add this line to fix the Logger issue
require 'bootsnap/setup' if defined?(Bootsnap)
