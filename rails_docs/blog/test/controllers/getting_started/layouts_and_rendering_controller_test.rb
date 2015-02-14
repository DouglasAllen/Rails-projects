require 'test_helper'

class GettingStarted::LayoutsAndRenderingControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
