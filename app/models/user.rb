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
  attr_accessible :name, :email, :password, :password_confirmation, 
  :remember_me, :slug, :profile_image, :bio, :banner

  validates_exclusion_of :name, :in => %w( admin oembed api facebook new popular featured favicon superuser pages partners categories creators platforms media posts authors types providers tagged ), :message => "You don't belong here"

  mount_uploader :profile_image, AvatarUploader
  
  friendly_id :name, use: :slugged

  has_one :profile

 has_many :category_users 
 has_many :categories, :through => :category_users

  has_many :posts, :through => :user_posts
  has_many :user_posts

  after_create :create_profile
  after_create :assign_default_role

   def assign_default_role
    add_role(:user)
  end


  def create_profile
    @profile = Profile.new(:user_id => id)
    @profile.save
  end
  
end
