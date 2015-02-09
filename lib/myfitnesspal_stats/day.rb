require 'mechanize'

class Day
  def initialize(year, month, day)
    @date = Date.new(year, month, day)
  end
end