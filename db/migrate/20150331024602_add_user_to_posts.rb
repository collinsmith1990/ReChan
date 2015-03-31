class AddUserToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :user
  end
end
