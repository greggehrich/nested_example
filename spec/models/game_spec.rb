#
#
#
#
#

require 'rails_helper'

RSpec.describe Game, :type => :model do

  before(:each) do
    @game = FactoryGirl.build(:game)
  end

  context 'when instantiated' do

    it 'should be of type Game' do
      expect(@game).to be_a Game
    end

    it 'should belong to Manufacturer' do
      expect(@game).to belong_to :manufacturer
    end

  end


  context 'when valid' do

    it 'is valid by default' do

      expect(@game).to be_valid

    end

  end

  context 'when using scopes' do

    it 'returns no games when searching for non-existent release date' do

      @game.save

      expect(Game.released_in(2044).count).to eq 0

    end

    it 'returns one game when searching for an existing release date' do

      @game.save

      expect(Game.released_in(@game.release_date).count).to eq 1

    end

  end

  context 'when not valid' do

    it 'is invalid without a name' do

      @game.name = ''
      expect(@game).to_not be_valid

    end

    it 'is invalid without a description' do
      @game.description = ''
      expect(@game).to_not be_valid
    end

    it 'is invalid without a release date' do
      @game.release_date = ''
      expect(@game).to_not be_valid
    end

    it 'is invalid without a manufacturer' do
      @game.manufacturer = nil
      expect(@game).to_not be_valid
    end

  end


end
