FactoryBot.define do
  factory :user do
    name  { "sample" }
    sequence(:email) { |n| "sample#{n}@example.com" }
    association :prefecture
    password  { "foobar" }
    password_confirmation { "foobar" }
  end  
end
