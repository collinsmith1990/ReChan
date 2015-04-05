# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
  users = []

  users << FactoryGirl.create(:user, user_name: "Carvel", password: "testpass")
  users << FactoryGirl.create(:user, user_name: "TheAdmin", password: "testpass")
  users << FactoryGirl.create(:user, user_name: "TestUser", password: "testpass")
  users << FactoryGirl.create(:user, user_name: "mmm", password: "testpass")
  users << FactoryGirl.create(:user, user_name: "Haaaa", password: "testpass")

  10.times do
    post = FactoryGirl.create(:post, user_id: users[rand(5)].id)
    5.times do
      FactoryGirl.create(:comment, post_id: post.id, user_id: users[rand(5)].id)
    end
    rand(150).times do
      FactoryGirl.create(:comment, post_id: post.id)
    end
  end

  100.times do
    FactoryGirl.create(:post)
  end

