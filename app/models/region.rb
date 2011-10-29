class Region < ActiveRecord::Base
  has_many :apartment
  has_many :sherlock

  def self.all_active
    return self.where(:active => true)
  end
end
