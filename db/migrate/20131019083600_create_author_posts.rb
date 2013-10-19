class CreateAuthorPosts < ActiveRecord::Migration
  def change
    create_table :author_posts do |t|
      t.integer :author_id
      t.integer :post_id

      t.timestamps
    end
  end
end
