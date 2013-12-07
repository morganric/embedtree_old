class CreateFacebookPages < ActiveRecord::Migration
  def change
    create_table :facebook_pages do |t|
      t.integer :user_id
      t.integer :fb_page_id

      t.timestamps
    end
  end
end
