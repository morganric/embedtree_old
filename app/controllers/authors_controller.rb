class AuthorsController < ApplicationController

def index
	@authors = Author.all

	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authors }
    end
end

def show
	@author = Author.find(params[:id])

	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @author }
   end
end

end