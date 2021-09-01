require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:yamada)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name's length should be within 20" do
    @user.name = "a"*21
    assert_not @user.valid?
  end

  test "name should include alphabet only" do
    @user.name = "takeshi tanaka"
    assert_not @user.valid?
  end

  test "profile should be within 200" do
    @user.profile = "a"*201
    assert_not @user.valid?
  end
  
end
