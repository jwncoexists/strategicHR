class Result < ActiveRecord::Base
  belongs_to :attempt
  belongs_to :question
end