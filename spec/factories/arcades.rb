# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :arcade do
    association :game
    association :location
    comment 'Broken 1UP button'
  end
end
