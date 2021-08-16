require "test_helper"

class MicropostListTest < ActionDispatch::IntegrationTest
  test "micropost list" do
    get microposts_path
    Micropost.all.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
end
