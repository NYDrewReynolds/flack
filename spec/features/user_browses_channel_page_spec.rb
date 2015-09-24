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
    
    it "sees the room title" do
      click_link "Login"
      fill_in "Screen name", with: "jjeff"
      fill_in "Password", with: "password"
      click_button "Login"
      
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
