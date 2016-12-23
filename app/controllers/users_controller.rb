class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: :update

  def index
  end

  def show
  end

  def update
    @user.update(user_params)

    respond_to do |format|
      format.js
    end
  end

  private
  def set_post
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def user_params
    params.require(:user).permit(:name, :school_name, :is_student)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
