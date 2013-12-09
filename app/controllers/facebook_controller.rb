class FacebookController < ApplicationController
  layout "facebook"

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all

    def base64_url_decode str
     encoded_str = str.gsub('-','+').gsub('_','/')
     encoded_str += '=' while !(encoded_str.size % 4).zero?
     Base64.decode64(encoded_str)
    end

    def decode_data str
       encoded_sig, payload = str.split('.')
       data = ActiveSupport::JSON.decode base64_url_decode(payload)
    end

    if params.has_key? "signed_request"

      require 'rest-graph'
    rg = RestGraph.new( :app_id => "1440239169528450", :secret => "884240b8d9bf9d868a1bd0f0465c90bf")
    @parsed_request = rg.parse_signed_request!(params["signed_request"])

      signed_request = params[:signed_request]
      @signed_request = decode_data(signed_request)

      
      @page_id = @signed_request["page"]["id"]
      @page_id = @page_id.to_i
      @page = FacebookPage.where(:fb_page_id => @page_id)
      # user_id = @page[0].user_id
      # @user_id = user_id

      redirect_to '/#{user_id}'

    else

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @profiles }
      end

    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    
    if params[:id] != "tagged" #weak
      @profile = Profile.find(params[:id])
      @posts = @profile.user.posts.order("created_at DESC").page(params[:page]).per(6)
    end
    
    respond_to do |format|
      if @profile
          format.html # show.html.erb
          format.json { render json: vanity_url_path(@profile) }
      else
          format.html { redirect_to root_url }
          format.json { render json: vanity_url_path(@profile).errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: vanity_url_path(@profile) }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to vanity_url_path(@profile), notice: 'Profile was successfully created.' }
        format.json { render json: vanity_url_path(@profile), status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: vanity_url_path(@profile).errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to vanity_url_path(@profile), notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: vanity_url_path(@profile).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
end
