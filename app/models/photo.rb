class Photo < ApplicationRecord

	belongs_to :category
	has_many :replys

end
