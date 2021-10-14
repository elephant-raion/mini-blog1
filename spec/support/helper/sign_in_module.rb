module SignInModule
  def sign_in_as(user)
    visit root_path
    click_link "Log in"

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "Log in"
  end
end