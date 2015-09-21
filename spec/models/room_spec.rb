require 'rails_helper'

RSpec.describe Room, type: :model do
  context "when created" do
    
    let(:valid_attributes) { { name: "rock" } }
    
    it "is valid" do
      room = Room.create(valid_attributes)
      
      expect(room).to be_valid
    end
    
    it "is invalid without a name" do
      room = Room.create()
      
      expect(room).not_to be_valid
    end
    
    it "is invalid unless name is unique" do
      room = Room.create(valid_attributes)
      invalid_room = Room.create(valid_attributes)
      
      expect(invalid_room).not_to be_valid
    end
  end
  
  context "when responding to other tables" do

    let(:valid_room) { Room.create(name: "rock") }
    before(:each) { valid_room }
    
    it "responds to users" do
      expect(valid_room).to respond_to(:users)
    end
    
    it "responds to messages" do
      expect(valid_room).to respond_to(:messages)
    end
  end
end
