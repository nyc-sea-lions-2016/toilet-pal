class User < ActiveRecord::Base

  has_secure_password
  acts_as_avatarable

  has_many :favorites, foreign_key: 'favoriter_id'
  has_many :favorite_toilets, through: :favorites, source: 'toilets'
  has_many :reviews, foreign_key: 'reviewer_id'
  has_many :reviewed_toilets, through: :reviews, source: 'toilets'

  before_save { self.email = email.downcase }
  validates :username, {presence: true, uniqueness: true, length: { maximum: 50 }}
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, :first_name, :last_name, :zip_code, :gender, {presence: true}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
