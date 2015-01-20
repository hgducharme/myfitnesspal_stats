require 'mechanize'

class Account
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
    web_crawler.get('http://www.myfitnesspal.com/') do |home_page|
      signin_page = web_crawler.click(home_page.link_with(:text => /Log In/))

      my_page = signin_page.form_with(:id => 'loginform') do |form|
        # Complete username field
        form.input_with(:name => 'username') do |username| 
          username = @username
        end

        # Complete password field
        form.input_with(:name => 'password') do |passowrd| 
          password = @password
        end

        puts "#{@username} has been successfully logged in!"
      end.submit
    end

  end # Account.login
end # class Account
