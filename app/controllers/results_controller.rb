class ResultsController < ApplicationController
  def edit
    @result = Result.find(params[:id])
    @attempt = Attempt.find(@result.attempt_id)
    @section = Section.find(@attempt.section_id)
    @course = Course.find(@section.course_id)
    @quiz = Quiz.find(@section.quiz_id)
    @count = Result.where(attempt_id: @attempt.id).count
    @question = Question.find(@result.question_id)
    @answers = []
    @answers = @question.answers.order('id ASC')
  end

  def update
    @result = Result.find(params[:id])
    @attempt = Attempt.find(@result.attempt_id)
    @section = Section.find(@attempt.section_id)
    @course = Course.find(@section.course_id)
    @quiz = Quiz.find(@section.quiz_id)
    @question = Question.find(@result.question_id)
    # save the user's answer in the result record
    if (params[:answer])
      @result.answer_id = Answer.where(question_id: @result.question.id, content: params[:answer]).first.id
    end

    if @result.save
      if params[:commit].upcase.include? "NEXT"
        redirect_to edit_result_path( Result.find(@result.next_question) )
      end
      if params[:commit].upcase.include? "PREVIOUS"
        redirect_to edit_result_path( Result.find(@result.prev_question) )
      end
      if params[:commit].upcase.include? "COMPLETE"
        redirect_to attempt_path(@attempt)
      end
    else
      render :edit
    end
  end

  def result_params
    params.require(:result).permit(:id, :attempt_id, :question_id, :correct_answer_id, :answer_id, :created_at, :updated_at)
  end
end
