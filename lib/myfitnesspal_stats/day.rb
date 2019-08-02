require_relative 'meal'
require 'mechanize'

class Day
  attr_reader :date

  def initialize(year, month, day)
    @date = Date.new(year, month, day)

    $web_crawler = Mechanize.new do |web_crawler|
      web_crawler.cookie_jar.load('cookies.yml')
      web_crawler.follow_meta_refresh = true

      login_page = 'http://www.myfitnesspal.com'
      $food_diary = web_crawler.get("#{login_page}/food/diary/#{@username}?date=#{@date}")

      update_cookies = web_crawler.cookie_jar.save('cookies.yml', 
        session: true)
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
    table_headers = $food_diary.search('tr.meal_header').search('td.first').children

    meal_headers = Hash.new

    table_headers.select do |table_header|
      meal = Meal.new

      meal_headers[table_header.text.to_sym] = meal.entries
    end

    meal_headers

=begin
----------------------
I call: 
  day.meals

I want to return: 
  # ==> { meal_1: {entries...}, meal_2: {entries...} }
----------------------
=end

  end # ---- meals

=begin
  # WIP
  def weight
    reports = @web_crawler.get("#{@login_page}/reports/")
    weight_report = reports.search('//optgroup')[0].children[0]
    @web_crawler.click(weight_report)
  end
=end

end # ---- class Day