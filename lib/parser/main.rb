# !!!!!DEPRECATED!!!!

require 'rubygems'
require 'mechanize'
require 'apt_list_page'
require 'apt_details_page'

max_apts_to_parse = ARGV[0] ||= 10

# TODO: This needs to be dynamic by region in the future, currently its just for northern va
url = "http://washingtondc.craigslist.org/nva/apa/"

va = AptListPage.new(url).parse(max_apts_to_parse.to_i)

va.apts.each do |apt|
  next unless apt.features.features_hash[:FIOS] == true
  puts "- "*50
  puts apt.url
  puts apt.features.true_to_s
end
