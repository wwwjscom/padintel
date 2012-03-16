class CreateSherlocks < ActiveRecord::Migration
  def self.up
    create_table :sherlocks do |t|
      t.text :desired, :null => true
      t.text :required, :null => true
      t.text :nots, :null => true
      t.integer :region_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sherlocks
  end
end
