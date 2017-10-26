FactoryBot.define do
  factory :user do
    name "testdata"
    email { Faker::Internet.email }
    password "abcdef"
  end
end
