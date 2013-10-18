class Post < ActiveRecord::Base
  attr_accessible :description, :embed_code, :image, :title, :url

  has_many :users, :through => :user_posts
  has_many :user_posts

end
