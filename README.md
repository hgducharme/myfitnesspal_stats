# MyfitnesspalStats

Myfitnesspal_Stats is a ruby module that allows you to programmatically access your daily nutritional information from [Myfitnesspal.com](http://www.myfitnesspal.com/). It gives you the ability to access your nutritional totals for a specified date, as well as the break down of each meal & food logged for that day.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'myfitnesspal_stats'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install myfitnesspal_stats

## Usage

Once installation is complete, you cam start accessing your information by initializing a new web scraper:

```ruby
# Insert your username and password for Myfitnesspal
# WARNING: DO NOT HARDCODE THIS INTO YOUR SCRIPT IF IT IS A PUBLIC SCRIPT. FUTURE REVISIONS WILL MAKE SURE TO SOLVE THIS PROBLEM.
scraper = Scraper.new('username', 'password')
```

To access a specified date and the nutritional information for that day, fetch a specified date and call the `nutrition_totals` method on that day.

```ruby
# The year, month, and day should all be numbers. Although a string will still work
scraper.get_date(year, month, day)

# Numbers do not have to be padded with zeros, it can be 01 or just 1.
day = scraper.get_date(2015, 01, 15)
# ==> #<Day:<object id>

# Note: The nutrients that are returned depend on which nutrients you specified to track in your Myfitnesspal settings.
# The returned hash has formatting like so: :<nutrient> => [how much you ate, your goal, the difference between the two].
pp day.nutrition_totals
# ==> 
{:Date=>"Thursday, 15 January 2015",
 :Calories=>[2, 2, -9],
 :Fat=>[49, 50, 1],
 :Carbs=>[296, 290, -6],
 :Fiber=>[45, 35, -10],
 :Protein=>[197, 195, -2],
 :"Potass."=>[2, 4, 1]}
```


<!-- 
days = Hash.new
(1..21).each do |day|
  nutrition = scraper.get_date(2015, 02, day).nutrition_totals
  date = Date.new(2015, 02, day).strftime("%a, %e %b")
  days["#{date}"] = nutrition
end

days.each { |number, nutrition_hash| pp nutrition_hash }
-->

## Contributing

1. Fork it ( https://github.com/hgducharme/myfitnesspal_stats/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/hgducharme/myfitnesspal_stats/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

