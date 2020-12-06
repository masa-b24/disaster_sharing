class ProfilesController < ApplicationController
  def show
    @post = current_user.posts
  end

  def update
    if current_user.update(user_params)
      redirect_to home_path, notice: "プロフィールが更新されました。"
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:avatar)
    end
end
