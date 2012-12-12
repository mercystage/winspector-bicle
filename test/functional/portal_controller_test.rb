require 'test_helper'

class PortalControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get tweet" do
    get :tweet
    assert_response :success
  end

end
