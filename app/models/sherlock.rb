class Sherlock < ActiveRecord::Base
	serialize :required, Array
	serialize :desired, Array
	serialize :nots, Array
end
