class CreateSherlocks < ActiveRecord::Migration
  def self.up
    create_table :sherlocks do |t|
      t.text :desired
      t.text :required
      t.text :nots

      t.timestamps
    end
  end

  def self.down
    drop_table :sherlocks
  end
end
