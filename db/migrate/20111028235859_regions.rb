class Regions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name
      t.string :url
      t.boolean :active
    end
  end

  def self.down
    drop_table :regions
  end
end
