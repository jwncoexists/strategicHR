class QuizResults < ActiveRecord::Base
  belongs_to :quiz_attempt
end
