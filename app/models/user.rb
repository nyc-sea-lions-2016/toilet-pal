class User < ActiveRecord::Base
  has_many :favorites, foreign_key: 'favoriter_id'
  has_many :favorite_toilets, through: :favorites, source: 'toilets'
  has_many :reviews, foreign_key: 'reviewer_id'
  has_many :reviewed_toilets, through: :reviews, source: 'toilets'
  has_many :identities

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

  def google_oauth2
    identities.where( :provider => "google_oauth2" ).first
  end

  def google_oauth2_client
    if !@google_oauth2_client
      @google_oauth2_client = Google::APIClient.new(:application_name => 'HappySeed App', :application_version => "1.0.0" )
      @google_oauth2_client.authorization.update_token!({:access_token => google_oauth2.accesstoken, :refresh_token => google_oauth2.refreshtoken})
    end
    @google_oauth2_client
  end
end
