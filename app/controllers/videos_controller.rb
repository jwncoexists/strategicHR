class VideosController < ApplicationController
  def index
    @videos = Video.all(order: "name asc")
  end

  def show
    @video = Video.find_by_slug(params[:id])
  end

  def new
    @video = Video.new
  end

  def edit
    @video = Video.find_by_slug(params[:id])
    authorize! :update, @video, message: "You don't have access to edit this video."
  end

  def create
    @video = Video.new(video_params)
    authorize! :create, @video, message: "You don't have access to create this video." 
    
    if @video.save
      flash[:notice] = "Video was created successfully."
      redirect_to @video
    else
      flash[:error] = "Error creating video. Please try again."
      render :new
    end
  end

  def update
     @video = Video.find_by_slug(params[:id])
     authorize! :update, @video, message: "You don't have access to update this video."
     
     if @video.update_attributes(video_params)
       redirect_to @video, notice: "Video has been updated."
     else
       flash[:error] = "Error saving video.  Please try again."
       render :edit
     end
  end

  def destroy
    @video = Video.find_by_slug(params[:id])
    authorize! :destroy, @video, message: "You don't have acccess to delete this video."
    name = @video.name
    if @video.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to videos_path
    else
      flash[:error] = "There was an error deleting the video"
      render :show
    end
  end

  private
  
  def video_params
    params.require(:video).permit(:id, :name, :description, :length, :url, :presenter, :slug, :created_at, :updated_at, :youtube_id)
  end
end
