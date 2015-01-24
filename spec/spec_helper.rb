$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'myfitnesspal_stats'
require 'bundler/setup'
require 'webmock/rspec'
require 'support/vcr_setup.rb'
require 'net/http'
require 'uri'
require 'mechanize'
Bundler.setup

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
