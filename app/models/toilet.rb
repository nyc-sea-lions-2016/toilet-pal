class Toilet < ActiveRecord::Base
	has_many :reviews
	has_many :favorites

	validates :name, :location, :description, presence: true

end
