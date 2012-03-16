require 'test_helper'

class PruneTest < ActiveSupport::TestCase
  
  test "deletes stale apt" do
    p = Prune.new(20)
    old_apts_size = Apartment.all.size
    p.perform
    assert_equal (old_apts_size-1), Apartment.all.size
  end
end
