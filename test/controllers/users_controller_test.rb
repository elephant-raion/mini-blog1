require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:yamada)
  end

  test "should get show" do
    get user_path(@user)
    assert_template 'users/show'
  end
end
