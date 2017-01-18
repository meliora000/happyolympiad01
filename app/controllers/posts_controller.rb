class PostsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]



  def index
    @posts = Post.all
  end

  def happytenth
    @posts = Post.all
  end



  def dance

  end

  def show

  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to [@post], notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to category_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_post
    @posts = Post.where(genre:params[:id])
    if params[:id] == "1"
      @genre = "tenth"
    elsif params[:id] == "2"
      @genre = "ppt"
    elsif params[:id] == "3"
      @genre = "movie"
    end

  end

  def post_params
    params.require(:post).permit(:name, :school, :year, :content, :rank, :genre, :avatar)
  end
end

