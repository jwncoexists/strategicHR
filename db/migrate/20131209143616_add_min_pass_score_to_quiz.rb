class AddMinPassScoreToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :num_questions_to_show, :integer
    add_column :quizzes, :passing_score, :integer
  end
end
