class User < ActiveRecord::Base

  has_secure_password
  acts_as_avatarable

  has_many :favorites
  has_many :favorite_toilets, through: :favorites, class_name: "Toilet", foreign_key: "user_id"
  has_many :reviews
  has_many :reviewed_toilets, through: :reviews, class_name: "Toilet"

  before_save { self.email = email.downcase }
  validates :username, {presence: true, uniqueness: true, length: { maximum: 50 }}
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, :first_name, :last_name, :zip_code, :gender, {presence: true}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
