class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def show
    @user = User.find(params[:id])
    @post = @user.posts
  end

  def last_month
    @user = User.find(params[:id])
    @post = @user.posts
  end

  def like
    @user = User.find(params[:id])
    @post = @user.posts
  end

  #def mypage
    #redirect_to user_path(current_user)
  #end
end
