class Type < ActiveRecord::Base
	extend FriendlyId
  attr_accessible :name

  validates_presence_of :name

  friendly_id :name, use: :slugged

  has_many :type_posts
  has_many :posts, :through => :type_posts
end
