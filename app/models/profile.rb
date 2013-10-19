class Profile < ActiveRecord::Base
	extend FriendlyId
  attr_accessible :banner, :bio, :display_name, :image, :user_id

  belongs_to :user

  validates_uniqueness_of :user_id

  mount_uploader :image, AvatarUploader
  mount_uploader :banner, BannerUploader

  friendly_id :user_name, use: :slugged

  protected

  def user_name
    user.name
  end

end
