class Account
  def initizalize(username, password)
    @username = username
    @password = password
  end

  def login
    agent = Mechanize.new do |agent|
      # MFP refreshes after login
      agent.follow_meta_refresh = true
    end

    # Go to homepage, click log in, and submit the form
    agent.get('http://www.myfitnesspal.com/') do |home_page|
      signin_page = a.click(home_page.link_with(:text => /Log In/))

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
