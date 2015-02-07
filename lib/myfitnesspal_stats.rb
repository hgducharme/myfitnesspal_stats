require_relative 'myfitnesspal_stats/version'
require_relative 'myfitnesspal_stats/account'
require_relative 'myfitnesspal_stats/client'
require 'mechanize'

# Possible gems to use:
# - markaby for generating html
# - RedCloth for generating html
# - hpricot or searching within html documents
# - REXML for parsing XML

=begin
  class Nutrition_data
  end

  class Weight
  end

  class Diary
  end
=end

module MyfitnesspalStats 
  def self.scrape
    Client.run
  end
end