#
#
#
#
#

require 'rails_helper'

RSpec.describe Location, :type => :model do

  before(:each) do
    @location = FactoryGirl.build :location
  end

  context 'when instantiated' do

    it 'should be of type Location' do

      expect(@location).to be_a Location
    end

    it 'should belong to State' do
      expect(@location).to belong_to :state
    end

    it 'should belong to Category' do
      expect(@location).to belong_to :category
    end

    it 'should have many games through arcades' do
      expect(@location).to have_many(:games).through(:arcades)
    end

  end

  it 'should order a locations games alphabetically' do

    game_1 = FactoryGirl.build(:game, name: 'Pac-Man')

    game_2 = FactoryGirl.build(:game, name: 'Ikari Warriors')

    game_3 = FactoryGirl.build(:game, name: 'Shinobi')

    @location.save

    @location.arcades.create(game: game_1)
    @location.arcades.create(game: game_2)
    @location.arcades.create(game: game_3)

    @location.reload

    expect(@location.games).to eq([game_2, game_1, game_3])

  end


  context 'when valid' do

    it 'has a default name of Pizza Works' do
      expect(@location.name).to eq('Pizza Works')
    end

    it 'can be assigned the name of an arcade' do
      location = Location.new
      location.name = '16-Bit Bar'
      expect(location.name).to eq('16-Bit Bar')
    end

  end

  context 'when not valid' do

    it 'is invalid without a zip code' do

      @location.zip = ''
      expect(@location).to_not be_valid

    end

    it 'is invalid when the zip code does not consist of exactly five integers' do

      @location.zip = '4320'
      expect(@location).to_not be_valid

    end

    it 'is invalid when the zip code does not consist of only integers' do

      @location.zip = '1234g'
      expect(@location).to_not be_valid

    end

    it 'is invalid without a city' do

      @location.city = ''
      expect(@location).to_not be_valid

    end

    it 'is invalid if name not unique' do

      @location.save

      @location_duplicate = FactoryGirl.build :location

      expect(@location_duplicate.save).to be_falsey

    end

  end



end
