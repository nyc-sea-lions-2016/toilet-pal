class User < ActiveRecord::Base

  has_secure_password
  acts_as_avatarable

  has_many :favorites
  has_many :favorite_toilets, through: :favorites, class_name: "Toilet"
  has_many :reviews
  has_many :reviewed_toilets, through: :reviews, class_name: "Toilet"

  validates :username, {presence: true, uniqueness: true}
  validates :email, :first_name, :last_name, :zip_code, :gender, {presence: true}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
