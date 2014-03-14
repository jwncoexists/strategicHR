class AttemptsController < ApplicationController
  def index
    @attempts = Attempt.all
  end

  def show
    @attempt = Attempt.find(params[:id])
    @section = Section.find(@attempt.section_id)
    @course = Course.find(@section.course_id)
    @quiz = Quiz.find(@section.quiz_id)
    @num_correct = @attempt.results.where('answer_id = correct_answer_id').count
    @num_questions = @attempt.results.count
    @passing_score = @quiz.passing_score
    @score = (@num_correct.to_f/@num_questions.to_f)*100.0
    @attempt.update_attribute(:end_time, Time.now)
    if !@attempt.passed && @score >= @passing_score
      @attempt.update_attribute(:passed, @score >= @passing_score)
    end
  end

  def new
    @section = Section.find(params[:section])
    @quiz = Quiz.find(@section.quiz_id)
    @course = Course.find(@section.course_id)
    @video = Video.find(@section.video_id)
    @attempt = Attempt.create(user_id: current_user.id, 
                              course_id: @course.id,
                              section_id: @section.id,
                              status: "Quiz Started",
                              start_time: Time.now,
                              end_time: Time.now
                              ) 
    @num_questions = [@quiz.questions.count, @quiz.num_questions_to_show].min
    
    # randomly pick questions for the quiz
    @questions = @quiz.questions.sample(@num_questions)

    #for each of the questions, create a result and set the correct answer
    # store the results as a linked list for traversing in views
    prev = nil
    @questions.each do |question|
      if prev != nil
        result = Result.create(attempt_id: @attempt.id,
                    question_id: question.id,
                    correct_answer_id: question.answers.where(correct: true).first.id,
                    prev_question: prev.id)
        prev.update_attribute(:next_question, result.id)
      else
        result = Result.create(attempt_id: @attempt.id,
                    question_id: question.id,
                    correct_answer_id: question.answers.where(correct: true).first.id)
        @first_result = result
      end
      prev = result
    end
  end


  private

  def attempt_params
    params.require(:attempt).permit(:id, :user_id, :section_id, :status, :course_id, :start_time, :end_time, :passed, :created_at, :updated_at,
                                    results_attributes: [:id, :attempt_id, :question_id, :correct_answer_id, :created_at, :updated_at,
                                                         :answer_id, :next_question, :prev_question, :_destroy] )
  end

end
