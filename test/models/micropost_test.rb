require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "Swag ballers")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "    "
    assert_not @micropost.valid?
  end

  test "content should be no longer than 1000 chars" do
    @micropost.content = "a" * 1001
    assert_not @micropost.valid?
  end

  test "order should be most recent first" do
    assert_equal Micropost.first, microposts(:Most_recent)
  end
end
