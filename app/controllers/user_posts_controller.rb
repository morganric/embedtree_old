class UserPostsController < ApplicationController

# DELETE /posts/1
# DELETE /posts/1.json
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