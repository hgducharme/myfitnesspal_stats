require 'mechanize'

class Day
  def initialize(year, month, day)
    @date = Date.new(year, month, day)

    @login_page = 'http://www.myfitnesspal.com'

    @web_crawler = Mechanize.new do |web_crawler|
      web_crawler.cookie_jar.load('cookies.yml')
      web_crawler.follow_meta_refresh = true
    end
  end # ---- initialize

  def nutrition_totals
    diary = @web_crawler.get("#{@login_page}/food/diary/#{@username}?date=
      #{@date}")
    totals_table = diary.search('tr.total')

    # Find which nutrients are being tracked, and put them into an array
    nutrients = diary.search('tfoot').search('td.alt').text.split(
      /(?<=[a-z])(?=[A-Z])/).to_a

    nutrient_totals = Hash.new
    nutrient_totals["Date"] = @date.strftime("%A, %B %e, %Y")

    # Go through the nutrients table, find the values for its respective column
    nutrients.each_with_index do |nutrient, index|
      todays_total = totals_table.search('td')[index+1].text.strip
      daily_goal = totals_table.search('td')[index+9].text.strip
      remaining = totals_table.search('td')[index+17].text.strip

      nutrient_totals[nutrient] = todays_total, daily_goal, remaining
    end

    nutrient_totals
  end # ---- nutrition_totals

  # WIP
  def weight
    reports = @web_crawler.get("#{@login_page}/reports/")
    weight_report = reports.search('//optgroup')[0].children[0]
    @web_crawler.click(weight_report)
  end
end # ---- class Day