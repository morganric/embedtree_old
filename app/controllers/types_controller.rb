class TypesController < ApplicationController

def index
	@types = Type.all

	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
end

def show
	@type = Type.find(params[:id])

	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type }
   end
end

end