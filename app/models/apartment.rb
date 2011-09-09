class Apartment < ActiveRecord::Base
	serialize :features, Array
	
	def self.find_with_features(required_features)
		Apartment.all.delete_if {|apt| (apt.features & required_features).size < required_features.size}
	end
	
end