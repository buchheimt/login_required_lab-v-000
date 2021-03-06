class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login

  def index
    redirect_to(sessions_login_path) unless current_user
  end

  def current_user
    session[:name]
  end

  def require_login
    redirect_to sessions_login_path unless session.include?(:name)
  end

end
