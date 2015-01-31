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
  end

  describe '#login' do
    let(:home_page) { "http://www.google.com" }

    # This is arbitrary, because Mechanize already tests the HTTP connection
    it 'connects to the home page', :vcr do
      home_page_cassette = File.new('vcr_cassettes/Account/_login/connects_to_the_home_page.yml', 'r')

      stub_request(:get, home_page).to_return(home_page_cassette)
    end

    it 'completes the login form and submits it', :vcr do

    end
  end

end
