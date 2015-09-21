require 'rails_helper'

RSpec.describe Message, type: :model do
  context "when created" do
    
    let(:user) { User.create(name: "Johnny Appleseed",
                             screen_name: "jappleseed",
                             uid: 1,
                             oauth_token: "12345",
                             oauth_token_secret: "abcde") }
    
    let(:room) { Room.create(name: "rock")}
    
    let(:valid_attributes) { { body: "sick message, dawg",
                               user_id: user.id,
                               room_id: room.id } }
    
    it "is valid" do
      message = Message.create(valid_attributes)
      
      expect(message).to be_valid
    end
    
    it "is invalid without a body" do
      message = Message.create(user_id: user.id, 
                               room_id: room.id)
      
      expect(message).not_to be_valid
    end
  end
  
  context "when responding to other tables" do

    let(:user) { User.create(name: "Johnny Appleseed",
                             screen_name: "jappleseed",
                             uid: 1,
                             oauth_token: "12345",
                             oauth_token_secret: "abcde") }

    let(:room) { Room.create(name: "rock")}

    let(:valid_message) { Message.create(body: "sick message, dawg",
                                         user_id: user.id,
                                         room_id: room.id) }
    
    before(:each) { valid_message }
    
    it "responds to user" do
      expect(valid_message).to respond_to(:user)
    end
    
    it "responds to room" do
      expect(valid_message).to respond_to(:room)
    end
  end
end
