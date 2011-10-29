class Region < ActiveRecord::Base
  has_many :apartment

  def self.all_active
    return self.where(:active => true)
  end
end
