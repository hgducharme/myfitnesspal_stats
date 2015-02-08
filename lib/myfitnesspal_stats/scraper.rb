require_relative 'account'
require 'mechanize'

class Scraper
  def initialize(username, password)
    @username = username
    @password = password
    @account = Account.new(username, password)

    @web_crawler = Mechanize.new do |web_crawler|
      @login_page = @account.login
      web_crawler.follow_meta_refresh = true
    end
  end # .initialize

  def get_macros
    diary = @login_page.link_with(href: "/food/diary/#{@username}").click
    totals = diary.search('tr.total')

    # Find which nutrients are being tracked, and put them into an array
    nutrient_titles = Hash.new
    nutrients = diary.search('tfoot').search('td.alt').text.split(
      /(?<=[a-z])(?=[A-Z])/).to_a

    # For each nutrient, iterate through the table rows and get the value in its respective column. Then push the nutrient and value into a hash.
    nutrients.each_with_index do |nutrient, index|
      puts totals.search('td')[index+1]
    end
  end
end