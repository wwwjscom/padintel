class Sherlock < ActiveRecord::Base
  belongs_to :region

	serialize :required, Array
	serialize :desired, Array
	serialize :nots, Array
end
