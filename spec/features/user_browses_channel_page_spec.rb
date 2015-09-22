require 'rails_helper'

RSpec.describe User, type: :feature do
  context "visits a channel page" do
    
    before(:each) { Room.create(name: "rock")
                    Room.create(name: "jazz")
                    Room.create(name: "pop")
                    visit root_path }
    
    it "sees the room title" do
      click_link("rock")
      
      expect(page).to have_content("rock")
    end
    
    xit "sees a form to submit a message" do
      click_link("rock")
      
      expect(page).to have_field("Message")
      expect(page).to have_button("Submit")
    end
  end
end
