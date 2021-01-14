require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a title, content, prefecture, and password" do
    post = FactoryBot.create(:post)
    puts "This post's user is #{post.user.inspect}" 
    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post = FactoryBot.build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).to include("を入力してください")
  end

  it "is invalid without a content" do
    post = FactoryBot.build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).to include("を入力してください")
  end

  it "is invalid without a prefecture" do
    post = FactoryBot.build(:post, prefecture: nil)
    post.valid?
    expect(post.errors[:prefecture]).to include("を入力してください")
  end

  it "is valid if content contains 50 characters or less" do
    post = FactoryBot.build(:post, content: Faker::Lorem.characters(number:50))
    post.valid?
    expect(post).to be_valid
  end

  it "is invalid if content contains 51 characters or more" do
    post = FactoryBot.build(:post, content: Faker::Lorem.characters(number:51))
    post.valid?
    expect(post.errors[:content]).to include("は50文字以内で入力してください")
  end

  # メソッドやスコープをテストしているわけではないから意味ないかも....モデルテストではないかな..
  before do
    @user = FactoryBot.create(:user)
  end

  describe "search message for a term" do
    before do
      @post1 = FactoryBot.create(:post, content: "This is the first message.")
      @post2 = FactoryBot.create(:post, content: "This is the second message.")
      @post3 = FactoryBot.create(:post, title: "Title1")
    end

    context "when a match is found" do
      it "returns posts that match the search term" do
        expect(Post.where('content LIKE ?', "%first%")).to include(@post1)
        expect(Post.where('content LIKE ?', "%first%")).to_not include(@post2)
        expect(Post.where('title LIKE ?', "%1%")).to include(@post3)
      end
    end
    
    context "when no match is found" do
      it "returns an empty collection" do
        expect(Post.where('content LIKE ?', "%hogehoge%")).to be_empty
      end
    end
  end
end
