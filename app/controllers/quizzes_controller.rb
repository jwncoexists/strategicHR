class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = Quiz.new
    1.times do
      question = @quiz.questions.build
      4.times { question.answers.build }
    end
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to @quiz, notice: "Successfully created quiz."
    else
      render :new
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(quiz_params)
      redirect_to @quiz, notice: "Successfully updated quiz."
    else
      render :edit
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_url, notice: "Successfully deleted quiz."
  end

  def answers
    @questions = @quiz.questions
  end

  private

  # answer-attr_accessible :content, :question_id
  # question-attr_accessible :content, :quiz_id, :answers_attributes
  # quiz-attr_accessible :name, :questions_attributes
  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: [:id, :content, :quiz_id, :_destroy,
                                          answers_attributes: [:id, :content, :correct, :question_id, :_destroy] ] )
  end

end
