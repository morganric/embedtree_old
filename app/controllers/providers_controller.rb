class ProvidersController < ApplicationController

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

	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @provider }
   end
end

end