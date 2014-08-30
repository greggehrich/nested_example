
FactoryGirl.define do

  sequence(:name) { |n| "Game #{n}" }

  factory :game do
    name
    release_date '1978'
    description 'Released in 1978, Space Invaders was one of the early blockbusters of the modern video game industry.'
    association :manufacturer, strategy: :build
  end

end
