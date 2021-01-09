FactoryBot.define do
  factory :comment do
    content { "A test comment" }
    association :post
    user { post.user } 
  end
end
