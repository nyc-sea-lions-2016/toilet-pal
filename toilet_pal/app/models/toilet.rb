class Toilet < ActiveRecord::Base
	has_many :reviews
	has_many :favorites
	has_many :reviewers, through: :reviews, class_name: 'User', foreign_key: 'reviewer_id'
	has_many :favoriters, through: :favorites

	validates :name, :location, :description, presence: true

end
