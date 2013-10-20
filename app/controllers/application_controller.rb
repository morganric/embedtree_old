class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :all # include all helpers, all the time

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_up_path_for(user)
    	redirect_to edit_profile_path(current_user)
  end

end
