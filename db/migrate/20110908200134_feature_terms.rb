class FeatureTerms < ActiveRecord::Migration
  def self.up
		create_table :feature_terms do |t|
			t.string :feature
			t.text :variations
			t.timestamps
		end
  end

  def self.down
		drop_table :feature_terms
  end
end
