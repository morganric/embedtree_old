class Provider < ActiveRecord::Base
	extend FriendlyId
  attr_accessible :name, :url

  validates_presence_of :name

  friendly_id :name, use: :slugged

  has_many :provider_posts
  has_many :posts, :through => :provider_posts

  def has_posts?
  	self.posts.count > 0
  end

 
end
