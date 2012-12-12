require 'test_helper'

class QuestionnaireControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get vote" do
    get :vote
    assert_response :success
  end

end
