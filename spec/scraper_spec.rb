require 'spec_helper'

describe Scraper, :vcr do 

 describe 'the initialization of a Scraper' do
    it 'takes a username and password argument successfully' do
      @scraper = Scraper.new('bob', '1234')
      expect(@scraper).to be_an_instance_of(Scraper)
    end
  end

  describe '#get_macros' do

  end

end