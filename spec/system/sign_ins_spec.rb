require 'rails_helper'

RSpec.describe "Sign-in", type: :system do
  let(:user) { create(:user) }

  it "is successful", js: true do
    visit root_path
    click_link "Log in"

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "Log in"

    expect(current_path).to eq root_path
  end

  it "is failure", js: true do
    visit root_path
    click_link "Log in"
    click_button "Log in"
    expect(page).to have_selector ".alert",
     text: "メールアドレスまたはパスワードが違います。"
  end

end
