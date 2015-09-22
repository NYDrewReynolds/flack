require 'rails_helper'

RSpec.describe User, type: :feature do
  context "visits the root page" do

    before(:each) { Room.create(name: "rock")
                    Room.create(name: "jazz")
                    Room.create(name: "pop")
                    visit root_path }
    
    it "sees a list of rooms to chat in" do
      expect(page).to have_link("rock")
      expect(page).to have_link("jazz")
      expect(page).to have_link("pop")
    end
  end
end
