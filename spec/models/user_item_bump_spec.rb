require 'rails_helper'

RSpec.describe UserItemBump, :type => :model do

  it "should be a valid UserItemBump" do
    expect(FactoryGirl.build(:user_item_bump)).to be_valid
  end

  it "should not allow a missing user" do
    expect(FactoryGirl.build(:user_item_bump, user_id: nil)).to be_invalid
  end

  it "should not allow a missing post" do
    expect(FactoryGirl.build(:user_item_bump, post_id: nil)).to be_invalid
  end

  it "should not allow duplicates" do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    FactoryGirl.create(:user_item_bump, user_id: user.id, post_id: post.id)
    expect(FactoryGirl.build(:user_item_bump, user_id: user.id, post_id: post.id)).to be_invalid
  end
end
