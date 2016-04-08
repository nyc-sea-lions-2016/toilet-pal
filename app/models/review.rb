class Review < ActiveRecord::Base
	belongs_to :reviewer, class_name: 'User'
	belongs_to :toilet

  validates :review_text, presence: true

  validate :unique_review

  def unique_review
    # Check to make sure user has not already reviewed that toilet.
  end

  def self.reviewer(review)
  	binding.pry
  	User.find_by(id: review.reviewer_id)
  end

end
