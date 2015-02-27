require_relative 'account'
require_relative 'day'
require 'mechanize'

class Scraper
  attr_reader :username

  def initialize(username, password)
    @username = username
    @password = password

    @date = Date.today

    @account = Account.new(username, password)
    $login_page = @account.login

    $web_crawler = Mechanize.new do |web_crawler|
      web_crawler.cookie_jar.load('cookies.yml')
      web_crawler.follow_meta_refresh = true
    end
  end # ---- initialize

  def get_date(year = @date.year, month = @date.month, day = @date.day)
    day = Day.new(year, month, day)
  end # ---- get_date
end # ---- class Scraper