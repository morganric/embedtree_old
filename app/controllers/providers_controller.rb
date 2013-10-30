class ProvidersController < ApplicationController
  load_and_authorize_resource 
  
def index
	@providers = Provider.all

  @published_providers = []

  @providers.each do |provider|
    if provider.has_posts?
      @published_providers << provider
    end
  end


	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @providers }
    end
end

def show
	@provider = Provider.find(params[:id])
  @posts = @provider.posts.order("created_at DESC").page(params[:page]).per(6)

	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @provider }
   end
end

end