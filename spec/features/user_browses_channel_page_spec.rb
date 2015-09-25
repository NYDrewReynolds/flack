require 'rails_helper'

RSpec.describe User, type: :feature do
  context "visits a channel page" do
    
    before(:each) { Room.create(name: "rock")
                    Room.create(name: "jazz")
                    Room.create(name: "pop")
                    User.create(name: "Jazzy Jeff",
                                screen_name: "jjeff",
                                password: "password")
                    visit root_path }
    
    let(:login) { click_link "Login"
                  fill_in "Screen name", with: "jjeff"
                  fill_in "Password", with: "password"
                  click_button "Login" }
    
    it "sees the room title" do
      login
      
      click_link("rock")
      
      expect(page).to have_content("rock")
    end
    
    it "sees a form to submit a message" do
      login
      
      click_link("rock")
      
      expect(page).to have_field("message")
      expect(page).to have_button("Send")
    end
  end
end
