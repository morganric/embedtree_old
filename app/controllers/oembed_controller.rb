class OembedController < ApplicationController
  def index
    # @posts = Post.all

    @url = params[:url]
    @slug = @url.split("/").last
    @post = Post.find(@slug)

    respond_to do |format|
      # format.html # index.html.erb
      # format.js # index.js.erb
      if params[:format] = "json"
        format.json { render :file => "oembed/index.json.erb", :content_type => 'application/json' }
      else
        format.xml { render :file => "oembed/index.xml.erb", :content_type => 'application/xml' }
      end    
    end
  end

end
