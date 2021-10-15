require 'rails_helper'

RSpec.describe "User edits", type: :system do
  let(:user) { create(:user) }
  let(:updated_user) { build(:user, :updated) }

  context "with a password" do
    context "matched the confirmation password" do
      it "is successful", js: true do
        sign_in_as(user)
        click_link "Profile"
        expect(current_path).to eq edit_user_registration_path
    
        fill_in "名前", with: updated_user.name
        fill_in "メールアドレス", with: updated_user.email
        fill_in "プロフィール", with: updated_user.profile
        fill_in "ブログURL", with: updated_user.url
        fill_in "パスワード", with: updated_user.password
        fill_in "確認用パスワード", with: updated_user.password
        
        click_button "Update"

        expect(page).to have_selector ".notice", text: "アカウント情報を変更しました。"
        expect(page).to have_field "名前", with: updated_user.name
        expect(page).to have_field "メールアドレス", with: updated_user.email
        expect(page).to have_field "プロフィール", with: updated_user.profile
        expect(page).to have_field "ブログURL", with: updated_user.url
        
        click_link "Log out"
        
        sign_in_as(updated_user)
        expect(page).to have_selector ".notice", text: "ログインしました。"
      end  
    end
    context "not matched the confirmation password" do
      it "is failure", js: true do
        sign_in_as(user)
        click_link "Profile"
        expect(current_path).to eq edit_user_registration_path
    
        fill_in "名前", with: updated_user.name
        fill_in "メールアドレス", with: updated_user.email
        fill_in "プロフィール", with: updated_user.profile
        fill_in "ブログURL", with: updated_user.url
        fill_in "パスワード", with: updated_user.password
        fill_in "確認用パスワード", with: updated_user.password + "hoge"
        
        click_button "Update"
        expect(page).to have_selector "#error_explanation"
      end  
    end
  end

  context "without a password" do
    it "is successful with valid parameters", js: true do
      sign_in_as(user)
      click_link "Profile"
      expect(current_path).to eq edit_user_registration_path
    
      fill_in "名前", with: updated_user.name
      fill_in "メールアドレス", with: updated_user.email
      fill_in "プロフィール", with: updated_user.profile
      fill_in "ブログURL", with: updated_user.url
      
      click_button "Update"
      
      expect(page).to have_selector ".notice", text: "アカウント情報を変更しました。"
      expect(page).to have_field "名前", with: updated_user.name
      expect(page).to have_field "メールアドレス", with: updated_user.email
      expect(page).to have_field "プロフィール", with: updated_user.profile
      expect(page).to have_field "ブログURL", with: updated_user.url
    end

    it "is failure with a invalid name", js: true do
      sign_in_as(user)
      click_link "Profile"
      expect(current_path).to eq edit_user_registration_path
    
      fill_in "名前", with: "Edit tester"
      
      click_button "Update"
      expect(page).to have_selector "#error_explanation"
    end
  end
end
