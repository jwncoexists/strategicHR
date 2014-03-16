class ReportsController < ApplicationController
  def index
    @courses = Course.all
    @video_data = []
    @video_data << ['Course', 'Video Minutes Watched']
    @certificate_data = []
    @certificate_data << ['Course', 'Certificates']
    @quiz_data = []
    @quiz_data << ['Course', 'Quizzes Passed', 'Quizzes Failed']

    @courses.each do |course|
      @video_data << [course.name, course.video_minutes_total]
      @certificate_data << [course.name, course.certificate_count]
      @quiz_data << [course.name, course.quizzes_passed_count, course.quizzes_failed_count]
    end
  end

end
