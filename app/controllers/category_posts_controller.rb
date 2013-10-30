class CategoryPostsController < ApplicationController

  def create

    @category_post = CategoryPost.create(params[:category_post])
    @post = Post.find(params[:category_post][:post_id])

    respond_to do |format|
      if @category_post.save
        # format.json { render json: post_path(@post), status: :created, location: @post }
        format.js { }
      else
        format.js { render @post  }
        # format.json { render json: post_path(@post).errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category_post = CategoryPost.find_by_category_id_and_post_id(params[:category_post][:category_id], params[:category_post][:post_id])
    @category_post.destroy

    respond_to do |format|
      format.js { }
      # format.json { head :no_content }
    end
  end

end