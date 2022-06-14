class Dish < ApplicationRecord
	belongs_to :restaurant
	has_many :reviews, as: :owner
end
