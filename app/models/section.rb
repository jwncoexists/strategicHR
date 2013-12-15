class Section < ActiveRecord::Base
  belongs_to :course
  has_one :video
  has_one :quiz
  has_many :attempts
end
