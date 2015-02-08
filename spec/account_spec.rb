require 'spec_helper'

describe Account, :vcr do
  before(:each) { @account = Account.new('bob', '1234') }

  describe 'the initilization of an Account' do
    it 'takes a username and password argument successfully' do
      expect(@account).to be_an_instance_of(Account)
    end
  end

  describe 'the process of logging into MFP' do
    let(:home_page) { "http://www.google.com" }

    # This is arbitrary, because Mechanize already tests the HTTP connection
    # Skip because implementation of VCR & Webmock needs revision
    skip 'connects to the home page' do
      home_page_cassette = File.new(
        'vcr_cassettes/Account/_login/connects_to_the_home_page.yml', 'r')
      stub_request(:get, home_page).to_return(home_page_cassette)
    end

    it 'completes the login form and submits it' do

    end
  end

end
