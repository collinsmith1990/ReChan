class AddUserAndPostIndexesToUserItemBumps < ActiveRecord::Migration
  def change
    add_index  :user_item_bumps, :user_id
    add_index  :user_item_bumps, :post_id
  end
end
