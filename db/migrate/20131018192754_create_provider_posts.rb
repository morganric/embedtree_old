class CreateProviderPosts < ActiveRecord::Migration
  def change
    create_table :provider_posts do |t|
      t.integer :provider_id
      t.integer :post_id

      t.timestamps
    end
  end
end
