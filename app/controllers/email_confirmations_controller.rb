
class EmailConfirmationsController < ApplicationController
  def new
    u = User.find_by(token: params[:token])
    u.update_attribute(:confirmed_at, Time.now)
    # redirect to the login screen
    redirect_to login_path, notice: "Your registration with StrategicHR by Dr. Bob Nelson has been confirmed. Please sign in."
  end
end
