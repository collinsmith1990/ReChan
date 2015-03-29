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
end
