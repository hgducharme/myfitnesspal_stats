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
    it 'connect to myfitnesspal homepage' do

    end
  end # -- #login
  
end # -- Account
