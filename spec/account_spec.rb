require 'spec_helper'

describe Account do
  before(:each) { @account = Account.new('bob', '1234') }

  describe '#initialize' do
    it 'takes a username and password argument successfully' do
      expect(@account).to be_an_instance_of(Account)
    end

    it 'sets the username and password to an instance variable' do
      @account.should respond_to(:username)
      @account.should respond_to(:password)
    end
  end # -- #initialize

  describe '#login' do
    before(:each) do
      stream = File.read('spec/html/mfp_home_page.html')

      FakeWeb.register_uri(:get,
        "https://www.myfitnesspal.com/",
        :body => stream,
        :content_type => "text/html")

      @web_crawler = Mechanize.new
      @home_page = @web_crawler.get("https://www.myfitnesspal.com/")
    end # -- before :each

    it 'clicks the log in link' do
      # It returns a hash w/ attributes, so get the #text attribute
      log_in_button = @home_page.link_with(:href => /#fancy_login/).text

      expect(log_in_button).to eq("#fancy_login")
    end

    it 'completes and submits the log in form' do
      log_in_button = @home_page.click(link_with(:href => /#fancy_login/).text)
      login_form = @home_page.form_with(:id => /loginform/)

      login_form['username'] = @username
      login_form['password'] = @password

      form.submit

      expect(login_form).to eq()
    end
  end # -- #login

end # -- Account
