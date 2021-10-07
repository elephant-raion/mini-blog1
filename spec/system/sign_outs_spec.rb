require 'rails_helper'

RSpec.describe "Sign-out", type: :system do
  let(:user) { create(:user)}
  
  it "is successful", js: true do
    visit root_path
    click_link "Log in"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "Log in"

    click_link "Log out"
    expect(page).to have_link "Log in", href: new_user_session_path
  end
end
