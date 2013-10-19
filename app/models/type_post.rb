class TypePost < ActiveRecord::Base
  attr_accessible :post_id, :type_id

  belongs_to :type
  belongs_to :post

end
