namespace :spider do
	desc "Crawl cl for new posts"
	task :crawl => [:environment] do
		Delayed::Job.enqueue Spider.new
	end
end