class Apartment < ActiveRecord::Base
	serialize :features, Array
  belongs_to :region
	
	def self.find_with_features(required_features, desired_features, nots_features, region_id, price_min, price_max)
    apts = Apartment.where(:region_id => region_id).order('created_at DESC')
    
    # Since price is optional, only filter by it when it's set
    # to non-default values.
    if price_max > 0
      apts = apts.where(:price => price_min..price_max)
    end
	  
      apts.delete_if {|apt| (apt.features & required_features).size < required_features.size} unless required_features.empty? 
      apts.delete_if {|apt| (apt.features - nots_features).size < apt.features.size} unless nots_features.empty? 
      apts.delete_if {|apt| (apt.features - desired_features).size == apt.features.size} unless desired_features.empty? 
    apts
	end
end
