require 'rails_helper'

RSpec.describe "Posts:", :type => :request do
  describe "Create a valid post" do
    it "should redirect to the new post's path." do
      visit posts_path

      click_link "Create a post"
      
      expect(current_path).to eq(new_post_path)

      fill_in "post_title", :with => "TestTitle"
      fill_in "post_content", :with => "TestContent"
      click_button "Create Post"

      expect(current_path).to eq(post_path(1))
      expect(page).to have_content("TestContent")      
    end
  end
  describe "Create an invalid post" do
    it "should re-render and display errors." do
      visit posts_path

      click_link "Create a post"
      
      expect(current_path).to eq(new_post_path)

      fill_in "post_title", :with => ""
      fill_in "post_content", :with => ""
      click_button "Create Post"

      expect(current_path).to eq(posts_path)
      expect(page).to have_content("The form contains 2 errors")      
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Content can't be blank")
    end
  end
end
