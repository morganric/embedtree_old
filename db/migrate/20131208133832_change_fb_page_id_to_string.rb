class ChangeFbPageIdToString < ActiveRecord::Migration
  def up
  	change_table :facebook_pages do |t|
      t.change :fb_page_id, :string
     end
  end

  def down
  	change_table :facebook_pages do |t|
      t.change :fb_page_id, :integer
     end
  end
end
