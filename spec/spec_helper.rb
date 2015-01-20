require 'bundler/setup'
Bundler.setup

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'myfitnesspal_stats'

# Libraries required for some test suites
require 'mechanize'

RSpec.configure do |config|
  # some (optional) config here
end
