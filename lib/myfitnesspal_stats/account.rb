require 'mechanize'

class Account
  #attr_reader :username, :password
  def initialize(username = nil, password = nil)
    @username = username
    @password = password

    @web_crawler = Mechanize.new do |web_crawler|
      web_crawler.follow_meta_refresh = true
    end
  end

  def login
    # Go to homepage, click log in, and submit the form
    home_page = @web_crawler.get('http://www.myfitnesspal.com/')
    login_form = home_page.form_with(id: "fancy_login")
    login_form['username'] = @username
    login_form['password'] = @password
    current_page = login_form.submit
    login_cookies = @web_crawler.cookie_jar.save('cookies.yml', session: true)

    # Checks to see if there was an error when logging in
    begin
      calories_left = current_page.search('div#calories-remaining-number').text
      return current_page
    rescue StandardError
      flash = current_page.search('p.flash').text.split(' ').to_a
      puts flash
      return false
    end
  
  end # Account.login
end # class Account