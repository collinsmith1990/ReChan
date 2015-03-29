class AddUserToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :user
    add_index :comments, :user_id
  end
end
