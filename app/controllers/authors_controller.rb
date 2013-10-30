class AuthorsController < ApplicationController
  load_and_authorize_resource 

def index
	@authors = Author.all
  @published_authors = []

  @authors.each do |author|
    if author.has_posts?
      @published_authors << author
    end
  end

	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authors }
    end
end

def show
	@author = Author.find(params[:id])
  @posts = @author.posts.order("created_at DESC").page(params[:page]).per(6)

	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @author }
   end
end

end