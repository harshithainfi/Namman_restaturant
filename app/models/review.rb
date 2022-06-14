class Review < ApplicationRecord
	belongs_to :owner, polymorphic: true
end
