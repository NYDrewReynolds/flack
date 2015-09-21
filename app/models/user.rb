class User < ActiveRecord::Base
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :messages
  
  validates :name,
    presence: true
  validates :screen_name,
    presence: true,
    uniqueness: true
  validates :uid,
    presence: true,
    uniqueness: true
  validates :oauth_token,
    presence: true,
    uniqueness: true
  validates :oauth_token_secret,
    presence: true,
    uniqueness: true
end
