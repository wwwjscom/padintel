class Apartments < ActiveRecord::Migration
  def self.up
		create_table :apartments do |t|
			t.string :url
			t.string :title
			t.text :features
      table.timestamps
		end
  end

  def self.down
		drop_table :apartments
  end
end
