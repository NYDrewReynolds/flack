require 'rails_helper'

RSpec.describe "user", type: :feature do
  context "unauthenticated" do

    before(:each) { visit root_path }
    
    it "sees a login button on the root page" do
      expect(page).to have_link("Login")
    end
  end
  
  context "authenticated" do

    before(:each) { Room.create(name: "rock")
                    Room.create(name: "jazz")
                    Room.create(name: "pop")
                    User.create(name: "Jazzy Jeff",
                                screen_name: "jjeff",
                                password: "password")
                    visit root_path }
    
    it "sees a list of rooms to chat in" do
      click_link "Login"
      fill_in "Screen name", with: "jjeff"
      fill_in "Password", with: "password"
      click_button "Login"
      
      expect(page).to have_link("rock")
      expect(page).to have_link("jazz")
      expect(page).to have_link("pop")
    end
  end
end
