class CreateTypePosts < ActiveRecord::Migration
  def change
    create_table :type_posts do |t|
      t.integer :type_id
      t.integer :post_id

      t.timestamps
    end
  end
end
