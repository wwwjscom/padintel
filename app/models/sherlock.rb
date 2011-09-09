class Sherlock < ActiveRecord::Base
	serialize :features, Array
end