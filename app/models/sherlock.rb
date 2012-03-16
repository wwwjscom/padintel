class Sherlock < ActiveRecord::Base
	serialize :required, Array
	serialize :desired, Array
	serialize :nots, Array

  belongs_to :region
end
