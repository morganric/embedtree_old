class OembedController < ApplicationController
  def index
    # @posts = Post.all

    @url = params[:url]
    @slug = @url.split("/").last
    @post = Post.find(@slug)

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.json { render :file => "oembed/index.json.erb", :content_type => 'application/json' }
    end
  end

end
