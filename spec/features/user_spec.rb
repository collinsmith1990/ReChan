require 'rails_helper'

RSpec.describe "User:", :type => :request do

  describe "Create new user" do
    it "should create a new user and redirect to the root." do
      visit root_url
      click_link "Sign up"

      expect(current_path).to eq(new_user_path)

      fill_in "User name", :with => "TestUser"
      fill_in "Password", :with => "Testpass"
      fill_in "Password confirmation", :with => "Testpass"

      expect{ click_button "Create User" }.to change{User.count}.by(1)
      expect(current_path).to eq("/")
      expect(page).to have_content("Log out")
      expect(page).not_to have_content("Sign up")
    end
  end

  describe "Create an invalid user" do
    it "should re-render and display errors." do
      visit new_user_path

      fill_in "User name", :with => "TestUser"
      fill_in "Password", :with => "Testpass"
      fill_in "Password confirmation", :with => ""
      click_button "Create User"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end

  describe "User logs in" do
    it "should log the user in." do
      user = FactoryGirl.create(:user)
      visit root_url
      click_link "Log in"

      fill_in "User name", :with => user.user_name
      fill_in "Password", :with => user.password
      click_button "Login"

      expect(current_path).to eq("/")
      expect(page).to have_content("Log out")
      expect(page).not_to have_content("Sign up")
    end
  end

  describe "User logs in with incorrect credentials" do
    it "should re-render login and display errors." do
      user = FactoryGirl.create(:user)
      visit login_path

      fill_in "User name", :with => user.user_name
      fill_in "Password", :with => "wrong_pass"
      click_button "Login"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid username/password combination")
    end
  end
end
