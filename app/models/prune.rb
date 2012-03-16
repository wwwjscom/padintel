class Prune

  # Make this model tableless
  def persisted?
    false
  end

  def initialize(days)
    @days = days.to_i
  end

	def perform
	  Apartment.destroy_all("created_at < '#{@days.days.ago}'")
  end
end