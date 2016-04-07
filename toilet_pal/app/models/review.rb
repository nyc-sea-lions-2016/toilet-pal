class Review < ActiveRecord::Base
  validates :review_text, presence: true

  validate :unique_review

  def unique_review
    # Check to make sure user has not already reviewed that toilet.
  end

end
