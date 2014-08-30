# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :location do
    name 'Pizza Works'
    city 'Hubbard'
    street '1234 Jump Street'
	  zip '44425'
    description 'Best breadsticks in town!'
	  association :category, strategy: :build
    association :state, strategy: :build
  end
end
