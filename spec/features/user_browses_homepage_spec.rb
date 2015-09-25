require 'rails_helper'

RSpec.describe "user", type: :feature do
  context "unauthenticated" do

    before(:each) { visit root_path }
    
    it "sees a login button on the root page" do
      expect(page).to have_link("Login")
    end
    
    it "sees a sign-up button on the roon page" do
      expect(page).to have_link("Sign Up")
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
    
    let(:login) { click_link "Login"
                  fill_in "Screen name", with: "jjeff"
                  fill_in "Password", with: "password"
                  click_button "Login" }
    
    it "takes the user to the room index upon authentication" do
      login
      
      expect(current_path).to eq(rooms_path)
    end
    
    it "creates an actual user" do
      user_count = User.count
      
      click_link "Sign Up"
      fill_in "Name", with: "Max"
      fill_in "Screen name", with: "Maximus"
      fill_in "Password", with: "password"
      click_button "Sign Up"
      
      expect(User.count).to eq(user_count + 1)
      expect(current_path).to eq(rooms_path)
      expect(page).to have_content("rock")
      expect(page).to have_content("jazz")
      expect(page).to have_content("pop")
    end
    
    it "sees a list of rooms to chat in" do
      login
      
      expect(page).to have_link("rock")
      expect(page).to have_link("jazz")
      expect(page).to have_link("pop")
    end
  end
end
