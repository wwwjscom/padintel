require 'test_helper'

class ApartmentTest < ActiveSupport::TestCase  
  
  test "price search" do
    assert_equal Apartment.find_with_features([], [], [], nil, 1699, 1701).size, 1
    assert_equal Apartment.find_with_features([], [], [], nil, 1700, 1700).size, 1
    assert_equal Apartment.find_with_features([], [], [], nil, 1701, 1702).size, 0
    assert_equal Apartment.find_with_features([], [], [], nil, 1701, 1699).size, 0
  end
end
