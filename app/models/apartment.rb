class Apartment < ActiveRecord::Base
	serialize :features, Array
	
	def self.find_with_features(required_features, desired_features, nots_features)
    apts = Apartment.all
		apts.delete_if {|apt| (apt.features & required_features).size < required_features.size}
    apts.delete_if {|apt| (apt.features - nots_features).size < apt.features.size}
    apts.delete_if {|apt| (apt.features - desired_features).size == apt.features.size}
    apts
	end
end
