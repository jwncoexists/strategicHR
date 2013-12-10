class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by_slug(params[:id])
    @sections = @course.sections.order(id: :asc)
    
    if (current_user)
      # find user's course status, create course_status for user if doesn't already exist
      @course_status = @course.course_statuses.where(user_id: current_user.id)
      if @course_status.empty?
        @course_status = CourseStatus.create(course_id: @course.id, 
                                             user_id: current_user.id)
      end
      # find user's section status, create section_statuses for user if doesn't already exist
      @section_statuses = @course.section_statuses.where(user_id: current_user.id, 
                                                         course_id: @course.id)
      if (!@sections.empty? && @section_statuses.empty?)
        @section_statuses = []
        @sections.each do |section|
          @section_statuses << SectionStatus.create(course_id: @course.id, 
                                                    user_id: current_user.id, 
                                                    section_id: section.id)
        end
      end
    end
  end

  def new
    @course = Course.new
    1.times do
      section = @course.sections.build
    end
  end

  def edit
    @course = Course.find_by_slug(params[:id])
    @sections = @course.sections.order(id: :asc)
    @videos = Video.all
    @quizzes = Quiz.all
    authorize! :update, @course, message: "You don't have access to edit this course."
  end

  def create
    @course = Course.new(course_params)
    authorize! :create, @course, message: "You don't have access to create this course." 
    
    if @course.save
      flash[:notice] = "Course was created successfully."
      redirect_to @course
    else
      flash[:error] = "Error creating course. Please try again."
      render :new
    end
  end

  def update
     @course = Course.find_by_slug(params[:id])
     authorize! :update, @course, message: "You don't have access to update this course."
     
     if @course.update_attributes(course_params)
       redirect_to @course, notice: "Course has been updated."
     else
       flash[:error] = "Error saving course.  Please try again."
       render :edit
     end
  end

  def destroy
    @course = Course.find_by_slug(params[:id])
    authorize! :destroy, @course, message: "You don't have acccess to delete this course."
    name = @course.name
    if @course.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to courses_path
    else
      flash[:error] = "There was an error deleting the course"
      render :show
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :price, :user_id, :ceu,
                                   sections_attributes: [:id, :video_id, :quiz_id, :sequence, :_destroy],
                                   course_statuses_attributes: [:id, :course_id, :user_id, :purchased_certificate],
                                   sections_statuses_attributes: [:id, :section_id, :course_id, :user_id, :completed_quiz, :_destroy]  )
  end

end
