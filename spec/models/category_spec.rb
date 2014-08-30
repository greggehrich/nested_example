require 'spec_helper'

describe Category do

  before(:each) do
    @category = FactoryGirl.build(:category)
  end
  
  it 'can be instantiated' do
 
    @category.should be_an_instance_of(Category)
  
  end

  it 'is invalid without a name' do

    @category.name = ''
    @category.should_not be_valid
  
  end

end
