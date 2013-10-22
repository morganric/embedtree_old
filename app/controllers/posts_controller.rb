class PostsController < ApplicationController
  load_and_authorize_resource 
  
  include PostsHelper
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    
    @post = Post.find(params[:id])
    
    respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @categories_post.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create

    if Post.where(:url => params[:post][:url]) != []
      @post = Post.where(:url => params[:post][:url])[0]
      if UserPost.where(:user_id => current_user, :post_id => @post.id) == [] 
        associate_user 
      end
      respond_to do |format|
        format.html { redirect_to @post, notice: 'Post already exists here... thanks for adding though.' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    else
     
      @post = Post.new(params[:post])
      unless params[:post][:url] == ""
      embedly(params[:post][:url])
      end

      respond_to do |format|
        if @post.save
          associate_user
          associate_provider
          associate_author
          associate_type
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render json: @post, status: :created, location: @post }
        else
          format.html { redirect_to :back, notice: 'Error posting' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
     end 

  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  # def tagged
  #   if params[:tag].present? 
  #     @posts = Post.tagged_with(params[:tag])
  #     @tag = params[:tag]
  #   else 
  #     @posts = Post.all
  #   end  
  # end

  def tagged
    if params[:tag].present? 
      @posts = Post.tagged_with(params[:tag])
      @tag = params[:tag]
      @tags = Post.tag_counts_on(:tags)
      render :action => 'tagged'
     else 
      @posts = Post.all
    end  
  end

  private 

  def associate_user
    if current_user
      UserPost.create!(:user_id => current_user.id, :post_id => @post.id )
    end
  end

  def associate_provider
    ProviderPost.create!(:post_id => @post.id, :provider_id => @provider.id )
  end

  def associate_author
    AuthorPost.create!(:post_id => @post.id, :author_id => @author.id )
  end

  def associate_type
    TypePost.create!(:post_id => @post.id, :type_id => @type.id )
  end

end
