class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  
  validates :body,
    presence: true
end
