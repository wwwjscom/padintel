class FeatureTerm < ActiveRecord::Base
	serialize :variations, Array
end
