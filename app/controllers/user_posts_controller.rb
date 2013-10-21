class UserPostsController < ApplicationController


  def create
    @user_post = UserPost.find_or_create_by_user_id_and_post_id(params[:user_id], params[:post_id])

    respond_to do |format|
      if @user_post.save
        format.html { redirect_to vanity_url_path(@profile), notice: 'Profile was successfully created.' }
        format.json { render json: vanity_url_path(@profile), status: :created, location: @profile }
        format.js { }
      else
        format.html { render action: "new" }
        format.js { }
        format.json { render json: vanity_url_path(@profile).errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_post = UserPost.find_by_user_id_and_post_id(params[:user_id], params[:post_id])
    @user_post.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { }
      format.json { head :no_content }
    end
  end

end