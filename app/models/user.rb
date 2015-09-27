class User < ActiveRecord::Base
  has_secure_password
  
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :messages
  
  validates :name,
    presence: true
  validates :screen_name,
    presence: true,
    uniqueness: true
  validates :password_digest,
    presence: true
end
