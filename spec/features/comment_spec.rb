require 'rails_helper'

RSpec.describe "Comments:", :type => :request do

  describe "Create a valid comment" do
    it "should redirect to the post's path and display the new comment." do
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.build(:comment)
      visit post_path(post)

      fill_in "comment_content", :with => comment.content
      click_button "Create Comment"

      expect(page).to have_content("Anonymous")      
      expect(page).to have_content(comment.content)      
      expect(page).to_not have_link("delete")
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

  describe "User creates a comment" do
    it "should create the comment with the username as a link to their profile" do
      user = FactoryGirl.create(:user, user_name: "TestUser")
      post = FactoryGirl.create(:post)
      comment = FactoryGirl.create(:comment, user_id: user.id, post_id: post.id)
      visit post_path(post)

      expect(page).to have_content(comment.content)
      expect(page).to have_link(user.display_name)

      click_link user.display_name

      expect(current_path).to eq(user_path(user))
    end
  end

  describe "Delete a comment from a post" do
    it "should delete the comment" do
      post = FactoryGirl.create(:post)
      user = FactoryGirl.create(:user)
      comment = FactoryGirl.create(:comment, user_id: user.id, post_id: post.id)
      visit login_path

      fill_in "User name", :with => user.user_name
      fill_in "Password", :with => user.password
      click_button "Login"

      visit post_path(post)

      click_link "delete"

      expect(current_path).to eq(post_path(post))
      expect(page).to_not have_content(comment.content)
    end
  end

  describe "Anonymous user tries to delete a comment" do
    it "should not show a delete link" do
      post = FactoryGirl.create(:post)
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:comment, user_id: user.id, post_id: post.id)
      visit post_path(post)

      expect(page).to_not have_content("delete")
    end
  end
end
