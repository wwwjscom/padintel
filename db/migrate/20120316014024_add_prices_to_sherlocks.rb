class AddPricesToSherlocks < ActiveRecord::Migration
  def self.up
    add_column :sherlocks, :price_max, :integer, :default => 0
    add_column :sherlocks, :price_min, :integer, :default => 0
  end

  def self.down
    remove_column :sherlocks, :price_max
    remove_column :sherlocks, :price_min
  end
end