FactoryBot.define do
  factory :post, class: Post do
    title { "A test title" }
    content { "A test content." }
    association :prefecture
    request_help { false }
    best_comment_id { nil }
    association :user

    trait :invalid do
      title nil
    end
  end
end

