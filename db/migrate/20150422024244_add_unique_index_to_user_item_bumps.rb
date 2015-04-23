class AddUniqueIndexToUserItemBumps < ActiveRecord::Migration
  def change
    add_index :user_item_bumps, [:user_id, :post_id], unique: true 
  end
end
