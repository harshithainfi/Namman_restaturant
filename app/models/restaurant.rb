class Restaurant < ApplicationRecord
	before_create :set_status
	has_many :dishes
	has_many :reviews, as: :owner

  def set_status
  	self.status = "active"
  end

  def flip_status
  	if status == "active"
  	self.status = "inactive"
  else
  	self.status = "active"
  end
  self.save
  end
   # handle_asynchronously :inactive_restaurant, :run_at => Proc.new { 1.minutes.from_now }
end
