class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]

  def show
    @user = User.find(params[:id])
    @post = current_user.posts
  end

  #def mypage
    #redirect_to user_path(current_user)
  #end
end
