class EventsController < ApplicationController
  # add video start/stop event to the Resque queue for background processing
  def create
    Resque.enqueue(VideoTime, current_user.id, params[:video], params[:status], Time.now().utc)
    render nothing: true
  end
end
