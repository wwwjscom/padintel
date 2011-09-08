require 'rubygems'
require 'active_record'

class AptsTable < ActiveRecord::Base
	set_table_name 'apartments'
end