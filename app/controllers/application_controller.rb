class ApplicationController < ActionController::Base
  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :prefecture_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :prefecture_id])
  end
end
