require 'rails_helper'

RSpec.describe "Comments:", :type => :request do
  describe "Create a valid comment" do
    it "should redirect to the post's path and display the new comment." do
      post = FactoryGirl.create(:post)
      visit post_path(post)

      fill_in "comment_content", :with => "Fantastic!"
      click_button "Create Comment"

      expect(page).to have_content("Anonymous")      
      expect(page).to have_content("Fantastic!")      
    end
  end
  describe "Create an invalid comment" do
    it "should re-render and display errors." do
      post = FactoryGirl.create(:post)
      visit post_path(post)

      fill_in "comment_content", :with => ""
      click_button "Create Comment"

      expect(page).to have_content("The form contains 1 error")      
      expect(page).to have_content("Content can't be blank")      
    end
  end
end
