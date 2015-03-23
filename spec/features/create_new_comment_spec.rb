require 'rails_helper'

RSpec.describe "CreateNewComment", :type => :request do
  describe "CreateNewComment" do
    it "Creates a new comment" do
      post = FactoryGirl.create(:post)
      visit post_path(post)

      fill_in "comment_commenter", :with => "Bob"
      fill_in "comment_content", :with => "Fantastic!"
      click_button "Create Comment"

      expect(page).to have_content("Bob")      
      expect(page).to have_content("Fantastic!")      
    end
  end
end
