
class EmailConfirmationsController < ApplicationController
  def new
    u = User.find_by(token: params[:token])
    if !u.confirmed_at
      u.update_attribute(:confirmed_at, Time.now)
      redirect_to login_path, notice: "Your registration with StrategicHR by Dr. Bob Nelson has been confirmed. Please log in."
    else
      redirect_to login_path, notice: "Your registration with StrategicHR by Dr. Bob Nelson was confirmed on #{u.confirmed_at}. Please log in."
    end
  end
end
