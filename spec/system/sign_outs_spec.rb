require 'rails_helper'

RSpec.describe "Sign-out", type: :system do
  let(:user) { create(:user)}
  
  it "is successful", js: true do
    sign_in_as(user)
    click_link "Log out"
    expect(page).to have_link "Log in", href: new_user_session_path
  end
end
