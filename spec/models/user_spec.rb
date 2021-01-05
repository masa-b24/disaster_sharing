require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, prefecture_id, and password" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "is invalid without a prefecture" do
    user = FactoryBot.build(:user, prefecture: nil)
    user.valid?
    expect(user.errors[:prefecture]).to include("を入力してください")
  end

  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "is valid if the password is 6 characters or more" do
    password = Faker::Internet.password(min_length: 6, max_length: 6)
    user = FactoryBot.build(:user, password: password, password_confirmation: password)
    expect(user).to be_valid
  end

  it "is invalid if the password is 5 characters or less" do
    password = Faker::Internet.password(min_length: 5, max_length: 5)
    user = FactoryBot.build(:user, password: password, password_confirmation: password)
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end
  
  it "is invalid if Password and confirmation do not match" do
    user = FactoryBot.build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end

  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "sample@example.com")
    user = FactoryBot.build(:user, email: "sample@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
