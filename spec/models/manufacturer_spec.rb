require 'rails_helper'

describe Manufacturer do

  before(:each) do
    @manufacturer = FactoryGirl.build(:manufacturer)
  end

  context 'when instantiated' do

    it 'should be of type Manufacturer' do
      expect(@manufacturer).to be_a Manufacturer
    end

    it 'should have many games' do
      expect(@manufacturer).to have_many :games
    end

  end

  context 'when adding games' do

    it 'should be invalid when adding more than five games' do

      6.times {
        @manufacturer.games << FactoryGirl.build(:game)
      }

      expect(@manufacturer).to_not be_valid

    end

  end

end
