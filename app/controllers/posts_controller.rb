require 'data'
require 'result'
class PostsController < ApplicationController
  # include CurrentUser
  # before_action :set_current_user
  before_action :check_current_user_is_signed_in, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :suggestions]

  def my_posts
    @posts = Post.where(user_id: current_user.id).order(created_at: :desc)
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(created_at: :desc)
    

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
   @answer = Answer.new
   @results = GoogleCustomSearchApi.search(@post.description.to_s)
   @result_list = Data.parse(@results)
   @results_list = Data.sort(@result_list)
  end

  def test_yaml
    @results = GoogleCustomSearchApi.search("Viet Nam holiday")
  end

  def test
    @results = GoogleCustomSearchApi.search("Raspberry Pi")
    @result_list = Data.parse(@results)
    @results_list = Data.sort(@result_list)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def check_current_user_is_signed_in
      unless current_user_signed_in?
        redirect_to root_url, notice: "Please sign in to do that"
      end
    end

    def current_user_signed_in?
        current_user ? true : false
    end

    # def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :user_id)
    end
end
