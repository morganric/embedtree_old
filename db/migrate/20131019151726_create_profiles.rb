class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :display_name
      t.string :image
      t.string :banner
      t.text :bio

      t.timestamps
    end
  end
end
