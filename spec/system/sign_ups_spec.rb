require 'rails_helper'

RSpec.describe "Sign-up", type: :system do

  it "is successful", js: true do
    visit root_path
    click_link "Sign up"

    expect {
      fill_in "名前", with: "test"
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "foobarfoobar"
      fill_in "確認用パスワード", with: "foobarfoobar"
      click_button "Create my account"
    }.to change(User, :count).by(1)

    expect(current_path).to eq root_path    
    expect(page).to have_selector ".notice", text: "アカウント登録が完了しました。"
  end

  it "is failure", js: true do
    visit root_path
    click_link "Sign up"

    expect {
      fill_in "名前", with: ""
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "foobarfoobar"
      fill_in "確認用パスワード", with: "foobarfoobar"
      click_button "Create my account"
    }.not_to change(User, :count)

    expect(page).to have_selector "#error_explanation"
  end

end
