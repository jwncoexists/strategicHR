class QuizAttempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :section
  belongs_to :quiz
end
