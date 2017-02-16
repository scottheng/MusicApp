class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def auth_token

  end

  def login!(user)
    @current_user = user
    @current_user.reset_session_token!
    session[:session_token] = @current_user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    session[:session_token].nil? ? false : true
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end
end
