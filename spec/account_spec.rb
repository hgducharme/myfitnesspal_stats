require 'spec_helper'

describe Account do
  before :each do
    @account = Account.new('bob', '1234')
  end

  describe '#initialize' do
    it 'takes a username and password argument successfully' do
      expect(@account).to be_an_instance_of(Account)
    end
  end # -- #initialize

  describe '#login' do
    before :each do
      stream = File.read('spec/html/mfp_home_page.html')
      FakeWeb.register_uri(:get,
        "https://www.myfitnesspal.com/",
        :body => stream,
        :content_type => "text/html")
    end # -- before :each

    it 'clicks the log in link' do
      web_crawler = Mechanize.new
      home_page = web_crawler.get("https://www.myfitnesspal.com/")

      # It returns a hash w/ attributes, so get the #text attribute
      log_in_button = home_page.link_with(:href => /#fancy_login/).text

      expect(log_in_button).to eq("#fancy_login")
    end
  end # -- #login

end # -- Account
