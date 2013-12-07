class FacebookPageController < ApplicationController
  def new
  	@facebook_page = FacebookPage.new
    respond_to do |format|
      format.html #new.html.erb
      format.js
      format.json { render json: @product}
    end
  end

  def create
  	@facebook_page = FacebookPage.new(params[:product])
    respond_to do |format|
      if @product.save
      	format.js
        format.html { redirect_to @product, notice: "Save process completed!" }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { 
          flash.now[:notice]="Save proccess coudn't be completed!" 
          render :new 
        }
        format.js
        format.json { render json: @product.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
  end
end
