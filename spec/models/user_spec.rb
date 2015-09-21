require 'rails_helper'

RSpec.describe User, type: :model do
  context "when created" do
    
    let(:valid_attributes) { { name: "Johnny Appleseed",
                               screen_name: "jappleseed",
                               uid: 1,
                               oauth_token: "12345",
                               oauth_token_secret: "abcde" } }
    
    it "is valid" do
      user = User.create(valid_attributes)
      
      expect(user).to be_valid
    end
    
    it "is invalid without a name" do
      user = User.create(screen_name: "jappleseed",
                         uid: 1,
                         oauth_token: "12345",
                         oauth_token_secret: "abcde")
      
      expect(user).not_to be_valid
    end
    
    it "is invalid without a screen name" do
      user = User.create(name: "Johnny Appleseed",
                         uid: 1,
                         oauth_token: "12345",
                         oauth_token_secret: "abcde")
      
      expect(user).not_to be_valid
    end
    
    it "is invalid unless screen name is unique" do
      user = User.create(valid_attributes)
      invalid_user = User.create(name: "Johnny Bananaseed",
                                 screen_name: "jappleseed",
                                 uid: 2,
                                 oauth_token: "1234567890",
                                 oauth_token_secret: "abcdefghij")
      
      expect(invalid_user).not_to be_valid
    end
    
    it "is invalid without a uid" do
      user = User.create(name: "Johnny Appleseed",
                         screen_name: "jappleseed",
                         oauth_token: "12345",
                         oauth_token_secret: "abcde")
      
      expect(user).not_to be_valid
    end
    
    it "is invalid unless uid is unique" do
      user = User.create(valid_attributes)
      invalid_user = User.create(name: "Johnny Bananaseed",
                                 screen_name: "jbananaseed",
                                 uid: 1,
                                 oauth_token: "1234567890",
                                 oauth_token_secret: "abcdefghij")
      
      expect(invalid_user).not_to be_valid
    end
    
    it "is invalid without an oauth token" do
      user = User.create(name: "Johnny Appleseed",
                         screen_name: "jappleseed",
                         uid: 1,
                         oauth_token_secret: "abcde")
      
      expect(user).not_to be_valid
    end
    
    it "is invalid unless the oauth_token is unique" do
      user = User.create(valid_attributes)
      invalid_user = User.create(name: "Johnny Bananaseed",
                                 screen_name: "jbananaseed",
                                 uid: 2,
                                 oauth_token: "12345",
                                 oauth_token_secret: "abcdefghij")
      
      expect(invalid_user).not_to be_valid
    end
    
    it "is invalid without an oauth_token_secret" do
      user = User.create(name: "Johnny Appleseed",
                         screen_name: "jappleseed",
                         uid: 1,
                         oauth_token: "12345")
      
      expect(user).not_to be_valid
    end
    
    it "is invalid unless oauth_token_secret is unique" do
      user = User.create(valid_attributes)
      invalid_user = User.create(name: "Johnny Bananaseed",
                                 screen_name: "jbananaseed",
                                 uid: 2,
                                 oauth_token: "1234567890",
                                 oauth_token_secret: "abcde")
      
      expect(invalid_user).not_to be_valid
    end
  end
  
  context "when responding to other tables" do

    let(:valid_attributes) { { name: "Johnny Appleseed",
                               screen_name: "jappleseed",
                               uid: 1,
                               oauth_token: "12345",
                               oauth_token_secret: "abcde" } }
    
    it "responds to messages" do
      user = User.create(valid_attributes)
      
      expect(user).to respond_to(:messages)
    end
    
    it "responds to rooms" do
      user = User.create(valid_attributes)
      
      expect(user).to respond_to(:messages)
    end
  end
end
