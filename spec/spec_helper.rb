$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'myfitnesspal_stats'
require 'bundler/setup'
require 'mechanize'
require 'webmock'
require 'vcr'
Bundler.setup

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end
