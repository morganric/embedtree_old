class EmbedController < ApplicationController
  before_filter :authenticate_user!

  layout 'embed'

  def show
    @post = Post.find(params[:post_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post }
    end
  end

end
