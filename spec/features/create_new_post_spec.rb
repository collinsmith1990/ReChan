require 'rails_helper'

RSpec.describe "CreateNewPost", :type => :request do
  describe "CreateNewPost" do
    it "Creates a new post" do
      visit posts_path

      click_link "Create a post"
      
      expect(current_path).to eq(new_post_path)

      fill_in "post_title", :with => "TestTitle"
      click_button "Create Post"

      expect(current_path).to eq(post_path(1))
    end
  end
end
