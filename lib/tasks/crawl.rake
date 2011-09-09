namespace :spider do
	desc "Crawl cl for new posts"
	task :crawl => [:environment] do
		ActiveRecord::Base.establish_connection Rails.env
		require 'rubygems'
		require 'active_record'
		require "app/jobs/parser/apt_list_page"
		
		max_apts_to_parse = 100
		
		# This link will need to change in the future...should be dynamic to search the US
		url = "http://washingtondc.craigslist.org/nva/apa/"
		va = AptListPage.new(url).parse(max_apts_to_parse)

		va.apts.each do |apt|
			Apartment.create(:url => apt.url, :title => apt.title, :features => apt.features.features_array)
		end
		
	end
end