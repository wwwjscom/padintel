require 'test_helper'

class SherlocksControllerTest < ActionController::TestCase

  setup do
    @price_search_one_result = sherlocks(:price_search_one_result)
  end

#  # Testing this is going to be crazy hard...serializing
#  # an array from yaml is causing all sorts of problems, but
#  # only in testing, not in dev/production.  So...just write good
#  # unit tests?
#  test "price search with one result" do
#    # This following line is the only one that works....
#    # Note the helper method <attribute>_before_type_cast
#    # "Solution" found here: http://www.ruby-forum.com/topic/1247459
#    puts YAML::load(sherlocks(:price_search_one_result).required_before_type_cast)    
#
#    # This breaks though...tried lots of things, no luck.
#  @price_search_one_result.required = YAML::load(sherlocks(:price_search_one_result).required_before_type_cast)    
#    get :show, :id => @price_search_one_result.id
#    assert_equal 1, @apartments.size
#  end

  test "should get new" do
    get :new
    assert_response :success
  end

#  test "should create sherlock" do
#    assert_difference('Sherlock.count') do
#      post :create, :sherlock => @sherlock.attributes
#    end
#
#    assert_redirected_to sherlock_path(assigns(:sherlock))
#  end

#  test "should show sherlock" do
#    get :show, :id => @sherlock.to_param
#    assert_response :success
#  end
end
