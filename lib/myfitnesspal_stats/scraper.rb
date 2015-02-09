require_relative 'account'
require_relative 'day'
require 'mechanize'

class Scraper
  def initialize(username, password)
    @username = username
    @password = password

    @date = Date.today

    @account = Account.new(username, password)
    @login_page = @account.login

    @web_crawler = Mechanize.new do |web_crawler|
      web_crawler.follow_meta_refresh = true
    end
  end # .initialize

  def get_nutrition(year = @date.year, month = @date.month, day = @date.day)
    date = Date.new(year, month, day)

    diary = @login_page.link_with(href: "/food/diary/#{@username}").click
    totals_table = diary.search('tr.total')

    # Find which nutrients are being tracked, and put them into an array
    nutrients = diary.search('tfoot').search('td.alt').text.split(
      /(?<=[a-z])(?=[A-Z])/).to_a

    nutrient_totals = Hash.new
    nutrient_totals["Date"] = date.strftime("%A, %B %e, %Y")

    # For each nutrient, iterate through the table rows and get the value in its respective column. Then push the nutrient and value into a hash.
    nutrients.each_with_index do |nutrient, index|
      todays_total = totals_table.search('td')[index+1].text.strip
      daily_goal = totals_table.search('td')[index+9].text.strip
      remaining = totals_table.search('td')[index+17].text.strip
      puts "-- #{nutrient}: \n Total: #{todays_total} \n Your goal: #{daily_goal} \n Remaining: #{remaining} \n\n"

      nutrient_totals[nutrient] = todays_total, daily_goal, remaining
    end

    nutrient_totals
  end

end