require "test_helper"

class MicropostListTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    Warden.test_mode!
    @user = users(:yamada)
    login_as(@user, :scope => :user)
  end

  test "micropost list" do
    get root_url
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
end
