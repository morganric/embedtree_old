class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def admin?
    current_user && current_user.admin?
  end

  def user?
    current_user && current_user.user?
  end

  def after_sign_up_path_for(user)
    	redirect_to edit_profile_path(current_user)
  end

end
