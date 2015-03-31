class Attempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :section
  belongs_to :course
  has_many :results, dependent: :destroy

end
