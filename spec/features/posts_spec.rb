require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "user creates a new post" do
    user = FactoryBot.create(:user)

    visit root_path
    click_link "ログイン", match: :first
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect {
      click_link "投稿する"
      fill_in "タイトル", with: "Test Post"
      fill_in "内容", with: "Trying out Capybara"
      select "岡山県", from: "post_prefecture_id"
      check "post_request_help"
      click_button "投稿"

      expect(page).to have_content "タスク「Test Post」を作成されました。"
      expect(page).to have_content "Trying out Capybara"
    }.to change(user.posts, :count).by(1)
  end
end
