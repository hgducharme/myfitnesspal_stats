require 'mechanize'

class Meal
  def initialize
    $web_crawler = Mechanize.new do |web_crawler|
      web_crawler.cookie_jar.load('cookies.yml')
      web_crawler.follow_meta_refresh = true

      login_page = 'http://www.myfitnesspal.com'
      $food_diary = web_crawler.get("#{login_page}/food/diary/#{@username}?date=#{@date}")
    end
  end # ---- initialize
end