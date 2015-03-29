require 'rails_helper'

RSpec.describe CommentsHelper, :type => :helper do

  it "should return commenters name from comment" do
    comment = FactoryGirl.create(:comment)
    expect(commenter_name(comment)).to eq(comment.commenter)
  end

  it "should return anonymous for a nil commenter" do
    comment = FactoryGirl.create(:comment, commenter: nil)
    expect(commenter_name(comment)).to eq("Anonymous")
  end
end
