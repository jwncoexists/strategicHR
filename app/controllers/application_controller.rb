class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    # Use find_by_id to get nil instead of an error if user doesn't exist
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id]) 
  end
  
  helper_method :current_user

  protected

  def authorize
    unless User.find(session[:user_id])
      redirect_to new_session_path, notice: "Please log in"
    end
  end
end
