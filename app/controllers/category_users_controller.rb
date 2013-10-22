class CategoryUsersController < ApplicationController

  def create
    @category_user = CategoryUser.find_or_create_by_category_id_and_user_id(params[:category_user][:category_id], params[:category_user][:user_id])

    respond_to do |format|
      if @category_user.save
        # format.json { render json: user_path(@user), status: :created, location: @user }
        format.js { }
      else
        format.js { }
        # format.json { render json: user_path(@user).errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category_user = CategoryUser.find_by_category_id_and_user_id(params[:category_user][:category_id], params[:category_user][:user_id])
    @category_user.destroy

    respond_to do |format|
      format.js { }
      # format.json { head :no_content }
    end
  end

end