require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect create" do
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { content: "Lorem ipsum"}}
    end
    assert_redirected_to root_url
  end
end
