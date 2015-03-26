require 'rails_helper'

RSpec.describe Comment, :type => :model do

  it "should be a valid comment" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  it "should not allow blank comments" do
    expect(FactoryGirl.build(:comment, content: "")).to be_invalid
  end

  it "should not allow comments larger than 1000 characters" do
    expect(FactoryGirl.build(:comment, content: "a" * 1001)).to be_invalid
  end
end
