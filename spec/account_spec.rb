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
    before(:all) do
      @home_page = 'http://www.myfitnesspal.com'
    end

    # This is arbitrary, because Mechanize already tests the HTTP connection
    it 'connects to the login page', :vcr do
      response = Net::HTTP.get_response(URI.parse(@home_page))
    end

    it 'completes the login form and submits it', :vcr do
    end
  end

end
