class CreateUserItemBumps < ActiveRecord::Migration
  def change
    create_table :user_item_bumps do |t|
      t.references :user
      t.references :post

      t.timestamps
    end
  end
end
