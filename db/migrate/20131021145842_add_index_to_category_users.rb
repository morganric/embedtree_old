class AddIndexToCategoryUsers < ActiveRecord::Migration
  def change
  	add_index :category_users, [:category_id, :user_id], unique: true
  end
end
