require "test_helper"
require "application_system_test_case"

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
    assert_select "form input#user_name" do
      assert_select "[value=?]", @user.name
    end
    name = 'nishida'
    patch user_registration_url params: { user: { name: name} }
    assert_redirected_to root_path
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form input#user_name" do
      assert_select "[value=?]", name
    end
  end

  test "should edit mail address" do
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form input#user_email" do
      assert_select "[value=?]", @user.email
    end
    email = 'tanaka@hotmail.com'
    patch user_registration_url, params: { user: { email: email} }
    assert_redirected_to root_path
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form input#user_email" do
      assert_select "[value=?]", email
    end
  end

  test "should edit profile" do
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form textarea#user_profile", @user.profile
    profile = 'I will running every day.'
    patch user_registration_url, params: { user: { profile: profile} }
    assert_redirected_to root_path
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form textarea#user_profile", profile
  end

  test "should edit url" do
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form input#user_url" do
      assert_select "[value=?]", @user.url
    end
    url = 'http://github.com/foofoohogehoge'
    patch user_registration_url, params: { user: { url: url} }
    assert_redirected_to root_path
    get edit_user_registration_path
    assert_template 'devise/registrations/edit'
    assert_select "form input#user_url" do
      assert_select "[value=?]", url
    end
  end


end
