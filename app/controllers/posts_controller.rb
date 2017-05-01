class PostsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
  before_action :set_index_post, only: [:index]
  before_action :set_post, only: [:show]
  before_action :find_post, only: [:edit, :update]



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
    @post
  end

  def create
    @post = Post.new(post_params)
    @post.year = 2017
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
        if @post.year == 2016
          format.html { redirect_to "/posts/shows/" + @post.year.to_s + "/" + @post.genre.to_s }
        else
          format.html { redirect_to "/posts/shows/" + @post.year.to_s }

        end
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
    if params[:year].present?
      @posts = Post.where(year:params[:year]).where(genre:params[:genre])
      @genre = params[:genre]
    else
      @posts = Post.where(year:params[:id])
    end
  end

  def set_index_post
    @posts = Post.where(year:params[:year])
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :school, :year, :content, :rank, :genre, :avatar)
  end
end

