require 'test_helper'

class SherlocksControllerTest < ActionController::TestCase
  setup do
    @sherlock = sherlocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sherlocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sherlock" do
    assert_difference('Sherlock.count') do
      post :create, :sherlock => @sherlock.attributes
    end

    assert_redirected_to sherlock_path(assigns(:sherlock))
  end

  test "should show sherlock" do
    get :show, :id => @sherlock.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sherlock.to_param
    assert_response :success
  end

  test "should update sherlock" do
    put :update, :id => @sherlock.to_param, :sherlock => @sherlock.attributes
    assert_redirected_to sherlock_path(assigns(:sherlock))
  end

  test "should destroy sherlock" do
    assert_difference('Sherlock.count', -1) do
      delete :destroy, :id => @sherlock.to_param
    end

    assert_redirected_to sherlocks_path
  end
end
