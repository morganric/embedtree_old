class Post < ActiveRecord::Base
	extend FriendlyId

  attr_accessible :description, :embed_code, :image, 
  :title, :url, :slug, :tag_list, :category_posts_atributes

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

 has_many :category_posts 
 has_many :categories, :through => :category_posts

accepts_nested_attributes_for :categories
accepts_nested_attributes_for :category_posts

paginates_per 5
# max_paginates_per 100

scope :hot,
	select("posts.id, count(user_posts.id) AS user_posts_count").
    joins(:user_posts).
    group("posts.id").
    order("user_posts_count DESC").
    uniq
end
