class Quiz < ActiveRecord::Base
  belongs_to :section
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true
end
