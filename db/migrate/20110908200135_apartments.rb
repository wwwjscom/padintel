class Apartments < ActiveRecord::Migration
  def self.up
		create_table :apartments do |t|
			t.string :url
			t.string :title
			t.text :features
      t.integer :region_id
      t.integer :price
      t.text :neighborhood

      t.timestamps
		end
  end

  def self.down
		drop_table :apartments
  end
end
