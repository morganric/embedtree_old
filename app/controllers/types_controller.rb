class TypesController < ApplicationController
  load_and_authorize_resource 
  
def index
	@types = Type.find(:all, :conditions => ["name != ?", "error" ])

	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
end

def show
	@type = Type.find(params[:id])
  @posts = @type.posts.order("created_at DESC").page(params[:page]).per(6)

	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type }
   end
end

end