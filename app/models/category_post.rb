class CategoryPost < ActiveRecord::Base
  attr_accessible :category_id, :post_id, :user_id

  belongs_to :post
  belongs_to :category

end
