require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase

  def setup
    @micropost = microposts(:Orange)
  end

  test "should redirect to create when not logged in" do
    assert_no_difference 'Micropost.count' do
      post :create, micropost: {content: "lorem ipsum"}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete :destroy, id: @micropost
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    assert_no_difference 'Micropost.count' do
      delete :destroy, id: microposts(:Ants)
    end
  end
end
