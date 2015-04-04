require 'rails_helper'

RSpec.describe "Posts:", :type => :request do
  describe "Create a valid post" do
    it "should redirect to the new post's path." do
      visit posts_path

      click_link "Create a post"
      
      expect(current_path).to eq(new_post_path)

      fill_in "post_title", match: :first, :with => "TestTitle"
      fill_in "post_content", match: :first, :with => "TestContent"
      click_button "Create Post", match: :first

      expect(current_path).to eq(post_path(1))
      expect(page).to have_content("TestContent")      
      expect(page).to have_content("Anonymous")
    end
  end
  describe "Create a valid post with user" do
    it "should create a valid post with a link to the user" do
      user = FactoryGirl.create(:user, user_name: "TestUser")
      post = FactoryGirl.build(:post)
      visit login_path

      fill_in "User name", :with => user.user_name
      fill_in "Password", :with => user.password
      click_button "Login"

      visit new_post_path
      
      fill_in "post_title", match: :first, :with => post.title
      fill_in "post_content", match: :first, :with => post.content
      click_button "Create Post", match: :first

      expect(page).to have_link(user.display_name)
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.content)
    end
  end
  describe "Create an invalid post" do
    it "should re-render and display errors." do
      visit posts_path

      click_link "Create a post"
      
      expect(current_path).to eq(new_post_path)

      fill_in "post_title", match: :first, :with => ""
      fill_in "post_content", match: :first, :with => ""
      click_button "Create Post", match: :first

      expect(current_path).to eq(posts_path)
      expect(page).to have_content("Title can't be blank")
    end
  end
  describe "Create a post with a link" do
    it "should create a post with the title as the user submitted link" do
      post = FactoryGirl.create(:post, link: "https://www.google.com/")
      visit post_path(post)

      expect(page).to have_selector("a[href='#{post.link}']", text: post.title)

      visit posts_path

      expect(page).to have_selector("a[href='#{post.link}']", text: post.title)
    end
  end
end
