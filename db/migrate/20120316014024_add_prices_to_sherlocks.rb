class AddPricesToSherlocks < ActiveRecord::Migration
  def self.up
    add_column :sherlocks, :price_max, :integer, :default => 0
    add_column :sherlocks, :price_min, :integer, :default => 0
    
    # Go through and update the old sherlocks to have the proper
    # default price values, instead of nils, which will cause errors
    Sherlock.where(:price_max => nil).each do |a|
      a.update_attribute(:price_max, 0)
      a.update_attribute(:price_min, 0)
    end
  end

  def self.down
    remove_column :sherlocks, :price_max
    remove_column :sherlocks, :price_min
  end
end