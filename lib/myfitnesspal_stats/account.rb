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
    login_form = home_page.form_with(id: "fancy_login")
    login_form['username'] = @username
    login_form['password'] = @password
    current_page = login_form.submit
    
    unless current_page.uri == "https://www.myfitnesspal.com/account/login"
      puts "#{@username} has been successfully logged in!"
    else
      puts "Uh-oh, the username or password was incorrect. Please try again."
    end
  
  end # Account.login
end # class Account