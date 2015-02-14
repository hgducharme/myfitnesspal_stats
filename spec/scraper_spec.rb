require 'spec_helper'

describe Scraper, :vcr do 
  
 describe 'the initialization of a Scraper' do
    it 'takes a username and password argument successfully' do
      @scraper = Scraper.new('rspec_test', '123456')
      expect(@scraper).to be_an_instance_of(Scraper)
    end
  end

  describe 'the get_nutrition method' do
    it 'takes a date' do

    end

    it 'does not fail if no date is given' do

    end

    it 'returns a hash with the date and macro totals' do

    end
  end
end