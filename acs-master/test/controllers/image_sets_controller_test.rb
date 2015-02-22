require 'test_helper'

class ImageSetsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get classify" do
    get :classify
    assert_response :success
  end

  test "should get import" do
    get :import
    assert_response :success
  end

end
