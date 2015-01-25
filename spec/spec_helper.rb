$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'myfitnesspal_stats'

require 'support/vcr_setup'
require 'webmock/rspec'
require 'mechanize'
require 'net/http'
require 'uri'
require 'bundler/setup'
Bundler.setup

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
