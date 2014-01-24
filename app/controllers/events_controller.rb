class EventsController < ApplicationController

  def create
    #REDIS.hmset(current_user.id, "email", current_user.email, 
    #            "video", params[:video], "status", params[:status], 
    #            "time", Time.now())
    render nothing: true
  end
end