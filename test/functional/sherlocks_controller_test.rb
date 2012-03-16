require 'test_helper'

class SherlocksControllerTest < ActionController::TestCase
  setup do
    @sherlock = sherlocks(:one)
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
end
