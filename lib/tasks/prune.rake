namespace :db do
	desc "Removes apartments older than 20 days"
	task :prune => [:environment] do
	  days = 20 # Any apt created > days ago will be pruned
		Delayed::Job.enqueue Prune.new(days)
	end
end