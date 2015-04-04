require 'rails_helper'

RSpec.describe Post, :type => :model do

  it "should be a valid post" do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  it "should not allow blank titles" do
    expect(FactoryGirl.build(:post, title: "")).to be_invalid
  end

  it "should not allow titles larger than 100 characters" do
    expect(FactoryGirl.build(:post, title: "a" * 101)).to be_invalid
  end

  it "should not allow content larger than 1000 characters" do
    expect(FactoryGirl.build(:post, content: "a" * 1001)).to be_invalid
  end

  it "should not allow invalid urls as links" do
    expect(FactoryGirl.build(:post, link: "google.com")).to be_invalid
  end

  it "should not allow blank urls" do
    expect(FactoryGirl.build(:post, link: " ")).to be_invalid
  end

  it "should not allow urls longer than 500 characters" do
    expect(FactoryGirl.build(:post, link: "a" * 501)).to be_invalid
  end
end
