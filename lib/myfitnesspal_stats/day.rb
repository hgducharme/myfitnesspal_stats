require 'mechanize'

class Day
  def initialize(year, month, day)
    @date = Date.new(year, month, day)

    $web_crawler = Mechanize.new do |web_crawler|
      web_crawler.cookie_jar.load('cookies.yml')
      web_crawler.follow_meta_refresh = true

      login_page = 'http://www.myfitnesspal.com'
      $food_diary = web_crawler.get("#{login_page}/food/diary/#{@username}?date=
      #{@date}")
    end
  end # ---- initialize

  def nutrition_totals
    totals_table = $food_diary.search('tr.total')

    nutrients = $food_diary.search('tfoot').search('td.alt').children.to_a
    nutrients.map! { |nutrient| nutrient = nutrient.text }

    nutrient_totals = Hash.new
    nutrient_totals[:Date] = @date.strftime("%A, %e %B %Y")

    # Go through the nutrients table, find the values for its respective column
    nutrients.each_with_index do |nutrient, index|
      todays_total = totals_table.search('td')[index+1].text.strip
      daily_goal = totals_table.search('td')[index+9].text.strip
      difference = totals_table.search('td')[index+17].text.strip

      nutrient_totals[nutrient.to_sym] = todays_total, daily_goal, difference
    end

    nutrient_totals
  end # ---- nutrition_totals

  def meals
    meal_headers = $food_diary.search('tr.meal_header').search('td.first').children.to_a
    meal_headers.map! { |header, value| header = header.text }
  end

=begin
  # WIP
  def weight
    reports = @web_crawler.get("#{@login_page}/reports/")
    weight_report = reports.search('//optgroup')[0].children[0]
    @web_crawler.click(weight_report)
  end
=end

end # ---- class Day