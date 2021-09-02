require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:yamada)
  end

  test "should get show" do
    get "/users/show/#{@user.id}"
    assert_template 'users/show'
  end
end
