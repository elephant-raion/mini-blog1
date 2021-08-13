require "test_helper"

class MicropostTest < ActiveSupport::TestCase

  test "should be valid" do
    micropost = Micropost.new(content: "Lorem ipsum")
    assert micropost.valid?
  end
  
  test "shoud be invalid" do
    micropost = Micropost.new(content: "a" * 141)
    assert_not micropost.valid?
  end

end
