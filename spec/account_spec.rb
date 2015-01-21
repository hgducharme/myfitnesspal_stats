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

      FakeWeb.register_uri(:get, 
        "https://www.myfitnesspal.com/",
        body: home_page,
        status: ["200", "Success"],
        content_type: "text/html")

      # You might need to comment this URI out, because Mechanize sometimes
      # doesn't work with the local stubs
      FakeWeb.register_uri(:get,
        "https://www.myfitnesspal.com/account/login",
        body: login_page,
        status: ["200", "Success"],
        content_type: "text/html")

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
      login_form = @login_page.form_with(:class => "form login")
      username = login_form["username"]
      password = login_form["password"]

      expect(login_form).to be_an_instance_of(Mechanize::Form)
      expect(username.value).to eq(@username)
      expect(password.value).to eq(@password)
    end

  end # -- #login

end # -- Account
