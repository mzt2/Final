FactoryBot.define do
  factory :post do
    association :user
    body "rspec"
    privacy 0
  end
end
