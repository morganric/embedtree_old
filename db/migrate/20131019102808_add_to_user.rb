class AddToUser < ActiveRecord::Migration
  def change
  	add_column :users, :slug, :string
  	add_column :users, :profile_image, :string
  	add_column :users, :bio, :text
  	add_column :users, :banner, :string
  	add_index :users, :slug, unique: true
  end
end
