class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
    @posts = Post.order("id")#.page(params[:posts_page]).per(5)
    @categories = Category.all
    @tags = Post.tag_counts_on(:tags)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

end
