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
scraper = Scraper.new('username', 'password')
```

To access a specified date and the nutritional information for that day:

```ruby
# The year, month, and day should all be numbers. Although a string will still work if you are stubborn
scraper.get_date(year, month, day)

# Example:
# Numbers do not have to be padded with zeros, it can be 01 or just 1.
scraper.get_date(2015, 01, 15)
# ==> #<Day:<object id>
```

## Contributing

1. Fork it ( https://github.com/hgducharme/myfitnesspal_stats/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/hgducharme/myfitnesspal_stats/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

