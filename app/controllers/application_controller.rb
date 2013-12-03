class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    # Use find_by_id to get nil instead of an error if user doesn't exist
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id]) 
  end
end
