require 'test_helper'

class FakePaypalControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
