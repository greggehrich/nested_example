require 'spec_helper'

describe State do

  before(:each) do
    @state = State.new
  end

  it 'can be instantiated' do

    @state.should be_an_instance_of(State)

  end

  it 'is invalid without a name' do

    @state.name = ''
    @state.should_not be_valid
  
  end

  it 'is invalid without an abbreviation' do

    @state.name = ''
    @state.should_not be_valid
  
  end

end
