#
#
#
#
#

require 'spec_helper'

describe 'Games to locations relationship' do

  before(:each) do

    @space_invaders = FactoryGirl.create(:game)
    @pac_man = FactoryGirl.create(:game, :name => 'Pac-Man')

    @bw3s = FactoryGirl.create(:location)

  end
  
  it 'should know when a location has no games' do
 
    @bw3s.games.count.should == 0
  
  end

  it 'should know when a location has multiple games' do

    @bw3s.games << @space_invaders
    @bw3s.games << @pac_man

    @bw3s.games.count.should == 2  

  end

  it 'should know a game is associated with multiple locations' do

    @bw3s.games << @space_invaders
    @space_invaders.reload.locations.size.should == 1

  end

end
