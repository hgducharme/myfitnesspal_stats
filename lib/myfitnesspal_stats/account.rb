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

    # Go to homepage, click log in, and submit the form
    home_page = web_crawler.get('http://www.myfitnesspal.com/')
    login_btn = web_crawler.click(home_page.link_with(:href => /#fancy_login/))

    login_form = signin_page.form_with(:id => 'loginform')
        # Complete username field
    form.input_with(:name => 'username') do |username| 
      username = @username

        # Complete password field
        form.input_with(:name => 'password') do |passowrd| 
          password = @password
        end

        puts "#{@username} has been successfully logged in!"
    end.submit

  end # Account.login
end # class Account
