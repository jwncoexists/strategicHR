class Attempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :section
  belongs_to :course
  has_many :results, dependent: :destroy

  def init_course_ids
    Attempt.all.each do |attempt|
      s = Section.find(attempt.section_id)
      attempt.update_attribute(:course_id, s.course_id)
    end
  end
end