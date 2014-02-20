class ReportsController < ApplicationController
  def index
    @courses = Course.all
    @course_data = []
    @course_data << ['Course', 'Certificates', 'Video Minutes Watched', 
                    'Quizzes Passed', 'Quizzes Failed']
    @courses.each do |course|
      @course_data << [course.name, course.certificate_count, course.video_minutes_total,
                       course.quizzes_passed_count, course.quizzes_failed_count]
    end
  end

end
