class Spider
	
	# Make this model tableless
  def persisted?
    false
  end

	def perform
		ActiveRecord::Base.establish_connection Rails.env
		require "#{RAILS_ROOT}/app/jobs/parser/apt_list_page"
		
		max_apts_to_parse = 100
		
		# This link will need to change in the future...should be dynamic to search the US
		url = "http://washingtondc.craigslist.org/nva/apa/"
		va = AptListPage.new(url).parse(max_apts_to_parse)

		i=0
		va.apts.each do |apt|
			Apartment.create(:url => apt.url, :title => apt.title, :features => apt.features.features_array)
			i+=1
		end
		puts "Added #{i} apartments"
	end

end