require 'rubygems'
require 'active_record'
require "db/apts_table"

# In the future, change this to search by city/state/etc, not just find all
va = AptsTable.find(:all)

va.apts.each do |apt|
  next unless apt.features.features_hash[:FIOS] == true
  puts "- "*50
  puts apt.url
  puts apt.features.true_to_s
end