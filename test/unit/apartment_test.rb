require 'test_helper'

class ApartmentTest < ActiveSupport::TestCase  
  
  test "price search" do
    assert_equal 1, Apartment.find_with_features([], [], [], nil, 0, 0).size, "Should find apts since price search is optional"
    assert_equal 1, Apartment.find_with_features([], [], [], nil, 1699, 1701).size
    assert_equal 1, Apartment.find_with_features([], [], [], nil, 1700, 1700).size
    assert_equal 0, Apartment.find_with_features([], [], [], nil, 1701, 1702).size, "No apartments should match this price range"
    assert_equal 0, Apartment.find_with_features([], [], [], nil, 1701, 1699).size
  end
end
