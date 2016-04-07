class Toilet < ActiveRecord::Base
	has_many :reviews
	has_many :favorites
	has_many :reviewers, through: :reviews, class_name: 'User', foreign_key: 'reviewer_id'
	has_many :favoriters, through: :favorites

	validates :name, :location, :description, presence: true

	def self.average_review(toilet)
		if (toilet.reviews.length) > 0
			(toilet.reviews.reduce(0){|sum,review| sum += review})/(toilet.reviews.length)
		else 
			'Be the first to review this toilet!'
		end
	end

end
