class Category < ActiveRecord::Base
	extend FriendlyId
  attr_accessible :name, :slug

  validates_uniqueness_of :name

  friendly_id :name, use: :slugged

  has_many :posts, :through => :category_posts
	has_many :category_posts

	has_many :users, :through => :category_users
	has_many :category_users


end
