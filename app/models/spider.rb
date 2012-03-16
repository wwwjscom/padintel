class Spider
	
	# Make this model tableless
  def persisted?
    false
  end

	def perform
    start_time = Time.now
		ActiveRecord::Base.establish_connection Rails.env
		require "#{RAILS_ROOT}/app/jobs/parser/apt_list_page"
		
		max_apts_to_parse = 100
    total = 0
    failures = 0
    added_tracker = {}
		
    Region.all_active.each do |r|
      region = AptListPage.new(r.url).parse(max_apts_to_parse)

      i=0
      region.apts.each do |apt|
        begin
        Apartment.create(:region_id => r.id, :neighborhood => apt.neighborhood, :price => apt.price, :url => apt.url, :title => apt.title, :features => apt.features.features_array)
        rescue
          puts "Apartment Creation Error:"
          puts $!
          failures += 1
          i -= 1
          total -= 1
        end
        i+=1
        total += 1
        added_tracker[r.name] = i
      end
    end
    added_tracker.each_pair do |r, i| puts "#{r}\t #{i}" end
    puts "Total added: #{total}"
    puts "Total failures: #{failures}"
    puts "Total time: #{Time.now - start_time}"
	end

end
