require 'test_helper'

class TerrainsControllerTest < ActionController::TestCase
  test "should get classify" do
    get :classify
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
