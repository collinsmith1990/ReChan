require 'rails_helper'

RSpec.describe User, :type => :model do


  it "should be a valid user" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "should not allow blank usernames" do
    expect(FactoryGirl.build(:user, user_name: "")).to be_invalid
  end

  it "should not allow blank passwords" do
    expect(FactoryGirl.build(:user, password: "", password_confirmation: "", password_digest:  "")).to be_invalid
  end

  it "should not allow non-unique displaynames" do
    user_name = "TestUser"
    FactoryGirl.create(:user, user_name: user_name)
    
    expect(FactoryGirl.build(:user, display_name: user_name)).to be_invalid
  end
  
  it "should lowercase user_name and set case sensitive display_name" do
    user_name = "TestUser"
    user = FactoryGirl.create(:user, user_name: user_name)
    expect(user.user_name).to eq(user_name.downcase)
    expect(user.display_name).to eq(user_name)
  end
end
