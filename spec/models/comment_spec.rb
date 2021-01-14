require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "generates associated data from a factory" do
    comment = FactoryBot.create(:comment)
    puts "This comment's post is #{comment.post.inspect}" 
    puts "This comment's user is #{comment.user.inspect}"
    expect(comment).to be_valid
  end

  # it "is invalid without a content" do
    # comment = FactoryBot.create(:comment, content: nil)
    # comment.valid?
    # expect(comment.errors[:content]).to include("を入力してください")
  # end
end
