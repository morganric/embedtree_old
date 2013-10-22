class AddIndexToCategoryPosts < ActiveRecord::Migration
  def change
  	add_index :category_posts, [:category_id, :post_id], unique: true
  end
end
