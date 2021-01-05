FactoryBot.define do
  factory :post, class: Post do
    title "A test title"
    content "A test content."
    prefecture { FactoryBot.create(:prefecture) }
    request_help false
    best_comment_id nil
    association :user
  end
end

