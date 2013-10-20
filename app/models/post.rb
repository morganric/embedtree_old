class Post < ActiveRecord::Base
	extend FriendlyId

  attr_accessible :description, :embed_code, :image, :title, :url, :slug, :tag_list

  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates_presence_of :url

  acts_as_taggable_on :tags

  friendly_id :title, use: :slugged

  has_many :users, :through => :user_posts
  has_many :user_posts

 has_one :provider_post
 has_one :provider, through: :provider_post

 has_one :author_post
 has_one :author, through: :author_post

 has_one :type_post
 has_one :type, through: :type_post

end
