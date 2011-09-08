require 'rubygems'
require 'active_record'
require "db/apts_table"
require "parser/apt_list_page"

ActiveRecord::Base.establish_connection(
	:adapter=> "mysql",
	:host => "localhost",
	:database=> "padintel",
	:username => "root",
	:password => "root"
)

# Setup the tables, currently done manually

# Call out to craigslist (nva area only)
max_apts_to_parse = ARGV[0] ||= 10
url = "http://washingtondc.craigslist.org/nva/apa/"
va = AptListPage.new(url).parse(max_apts_to_parse.to_i)


# DEBUG: The following block tests feature selection and outputs the results
#va.apts.each do |apt|
#  next unless apt.features.features_hash[:FIOS] == true
#  puts "- "*50
#  puts apt.url
#  puts apt.features.true_to_s
#end