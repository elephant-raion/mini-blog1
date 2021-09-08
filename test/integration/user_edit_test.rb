require "test_helper"

class UserEditTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    Warden.test_mode!
    @user = users(:yamada)
    login_as(@user, :scope => :user)
  end

  test "should edit user name" do
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form input#user_name[value=yamada]"
    name = 'nishida'
    patch user_registration_path params: {name: name}
    assert_redirected_to root_path
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form input#user_name[value=#{name}]"
  end

  test "should edit mail address" do
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    email = 'tanaka@hotmail.com'
    patch user_registration_path, params: {email: email}
    assert_redirected_to root_path
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form input#user_email[value=#{email}]"
  end

  test "should edit profile" do
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    profile = 'I will running every day.'
    patch user_registration_path, params: {profile: profile}
    assert_redirected_to root_path
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form textarea#user_profile", profile
  end

  test "should edit url" do
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    url = 'http://github.com/foofoohogehoge'
    patch user_registration_path, params: {url: url}
    assert_redirected_to root_path
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form input#user_url[value=#{url}]"
  end


end
