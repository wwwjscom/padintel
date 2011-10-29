class AddGardenLevelFeature < ActiveRecord::Migration
  def self.up
    FeatureTerm.create(:feature => 'garden level', :variations => ["garden level", "garden lvl"])
  end

  def self.down
    x = FeatureTerms.find_by_feature('garden level')
    FeatureTerm.delete(x)
  end
end
