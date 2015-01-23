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
      home_page = File.read('spec/html/mfp_home_page.html')
      login_page = File.read('spec/html/mfp_login_page.html')


      @web_crawler = Mechanize.new
      @home_page = @web_crawler.get("https://www.myfitnesspal.com/")
      @login_page = @web_crawler.get("https://www.myfitnesspal.com/account/login")
    end # -- before :each

    # This is arbitrary, because Mechanize already tests for the connection
    it 'connects to the login page' do
      http_status = @login_page.code.to_i

      expect(http_status).to be == 200
    end

    it 'completes the login form and submits it' do
      
    end

  end # -- #login

end # -- Account
