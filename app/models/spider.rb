class Spider
	
	# Make this model tableless
  def persisted?
    false
  end

	def perform
		ActiveRecord::Base.establish_connection Rails.env
		require "#{RAILS_ROOT}/app/jobs/parser/apt_list_page"
		
		max_apts_to_parse = 100
    total = 0
		
    Region.all_active.each do |r|
      region = AptListPage.new(r.url).parse(max_apts_to_parse)

      i=0
      region.apts.each do |apt|
        Apartment.create(:region_id => r.id, :neighborhood => apt.neighborhood, :price => apt.price, :url => apt.url, :title => apt.title, :features => apt.features.features_array)
        i+=1
        total += 1
      end
      puts "Added #{i} apartments to region #{r.name}"
    end
    puts "Total added: #{total}"
	end

end
