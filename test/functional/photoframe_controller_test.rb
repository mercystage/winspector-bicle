require 'test_helper'

class PhotoframeControllerTest < ActionController::TestCase
  test "should get detail" do
    get :detail
    assert_response :success
  end

  test "should get regist" do
    get :regist
    assert_response :success
  end

end
