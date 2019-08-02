require 'mechanize'

class Meal
  def initialize
    $web_crawler = Mechanize.new do |web_crawler|
      cookies = web_crawler.cookie_jar.load('cookies.yml')
      web_crawler.follow_meta_refresh = true
    end
  end # ---- initialize

  def entries
    entires = $food_diary.search()
  end
end # ---- class Meal