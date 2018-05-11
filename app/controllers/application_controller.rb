class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authentication
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
  end

  def after_sign_out_path_for(resource)
    # '/users/sign_in' # サインアウト後のリダイレクト先URL
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  private
  def authentication
    if not params[:id].nil? then
      if params[:controller] == "users" then
        @user = User.find(params[:id])
      elsif params[:controller] == "todos" then
        @user = User.find(Todo.find(params[:id]).user_id) unless params[:id].nil?
      end
      redirect_to root_path unless @user == authenticate_user!
    end
  end
end
