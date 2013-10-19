class AuthorPost < ActiveRecord::Base
  attr_accessible :author_id, :post_id

  belongs_to :author
  belongs_to :post


end
