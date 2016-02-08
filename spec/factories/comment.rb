FactoryGirl.define do
  factory :comment do
    sequence(:text)  { |n| "#{Faker::Lorem.words(5).join(' ')} #{n}" }
    topic { FactoryGirl.create(:topic) }
    comment { nil }
  end
end