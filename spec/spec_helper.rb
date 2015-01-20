require 'bundler/setup'
Bundler.setup

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'myfitnesspal_stats'

# Libraries required for some test suites
require 'mechanize'
require 'fakeweb'
FakeWeb.allow_net_connect = false

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
