require 'spec_helper'

describe Account do
  before :all do
    @account = Account.new('bob', '1234')
  end

  describe '#initialize' do
    it 'takes a username and password argument successfully' do
      @account.should be_an_instance_of Account
    end
  end # -- #initialize

  describe '#login' do
    it 'connects to myfitnesspal homepage' do
      stream = File.read('')
      host = "https://www.myfitnesspal.com/"
      web_crawler = Mechanize.new
      home_page = web_crawler.get(host)

      expect(home_page.title).to be true
    end
  end # -- #login

end # -- Account
