FactoryGirl.define do
  factory :topic do
    sequence(:text)  { |n| "#{Faker::Lorem.words(5).join(' ')} #{n}" }
  end
end