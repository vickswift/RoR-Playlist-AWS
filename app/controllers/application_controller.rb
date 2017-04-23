class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    redirect_to '/sessions/new' if session[:user_id] == nil
  end

  def require_correct_user
    user = User.find(params[:id])
    redirect_to "sessions/new" if current_user != user
  end

  def current_user
    # return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end
