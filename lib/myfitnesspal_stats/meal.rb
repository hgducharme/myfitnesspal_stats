require 'mechanize'

class Meal
  def initialize
    $web_crawler = Mechanize.new do |web_crawler|
      web_crawler.cookie_jar.load('cookies.yml')
      web_crawler.follow_meta_refresh = true
    end
  end # ---- initialize
end # ---- class Meal