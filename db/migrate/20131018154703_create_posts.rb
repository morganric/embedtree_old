class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :embed_code
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
