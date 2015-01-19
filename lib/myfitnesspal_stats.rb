require_relative 'myfitnesspal_stats/version'
require 'net/http'
require 'open-uri'
require 'yaml'
require 'mechanize'

# Possible gems to use:
# - markaby for generating html
# - RedCloth for generating html
# - hpricot or searching within html documents
# - REXML for parsing XML

module MyfitnesspalStats
=begin
  class Day

  end

  class Food

  end

  class Weight

  end
=end
end

account = MyfitnesspalStats::Account.new
account.login
