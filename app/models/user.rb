class User < ActiveRecord::Base
  extend FriendlyId
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :slug, :profile_image, :bio, :banner

  mount_uploader :profile_image, AvatarUploader
  
  friendly_id :name, use: :slugged

  has_one :profile

  has_many :posts, :through => :user_posts
  has_many :user_posts

  after_create :create_profile

  def create_profile
    Profile.new(:user_id => current_user.id)
  end
  
end
