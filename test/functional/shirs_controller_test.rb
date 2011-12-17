require 'test_helper'

class ShirsControllerTest < ActionController::TestCase
  setup do
    @shir = shirs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shirs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shir" do
    assert_difference('Shir.count') do
      post :create, :shir => @shir.attributes
    end

    assert_redirected_to shir_path(assigns(:shir))
  end

  test "should show shir" do
    get :show, :id => @shir.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shir.to_param
    assert_response :success
  end

  test "should update shir" do
    put :update, :id => @shir.to_param, :shir => @shir.attributes
    assert_redirected_to shir_path(assigns(:shir))
  end

  test "should destroy shir" do
    assert_difference('Shir.count', -1) do
      delete :destroy, :id => @shir.to_param
    end

    assert_redirected_to shirs_path
  end
end
