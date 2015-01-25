require 'mechanize'

class Account
  attr_reader :username, :password
  def initialize(username, password)
    @username = username
    @password = password
  end

  def login
    web_crawler = Mechanize.new do |web_crawler|
      # MFP refreshes after login
      web_crawler.follow_meta_refresh = true
    end
=begin
    # Go to homepage, click log in, and submit the form
    home_page = web_crawler.get('http://www.myfitnesspal.com/')
    login_btn = web_crawler.click(home_page.link_with(:href => /#fancy_login/))

    login_form = home_page.forms_with(:action => "https://www.myfitnesspal.com/account/login")
    login_form.each { |f| puts f.action }

        # Complete username field
    login_form.input_with(:name => 'username') do |username| 
      username = @username

        # Complete password field
        login_form.input_with(:name => 'password') do |password| 
          password = @password
        end

        puts "#{@username} has been successfully logged in!"
    end.submit
=end

  end # Account.login
end # class Account

Bob = Account.new('bob', '1234')
Bob.login
