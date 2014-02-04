class Course < ActiveRecord::Base
  before_save :update_slug

  has_many :sections, dependent: :destroy
  has_many :videos, through: :sections
  has_many :quizzes, through: :sections
  accepts_nested_attributes_for :sections, allow_destroy: true
  has_many :certificates
  has_many :ceus, dependent: :destroy
  accepts_nested_attributes_for :ceus, allow_destroy: true

  def update_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end

  # return status of N/A, Not Started, In Progress, Completed, Certificate Purchased
  def my_status(user_id)
    return_status = "Coming Soon! This elearning course is not yet available."
    if (self.released)
      if (!self.certificates.where(user_id: user_id).empty?)
          return_status = "Course Completed!  Certificate Purchased."
      else
        if (!Stat.where(user_id: user_id, course_id: self.id).empty?)
          return_status = "In Progress."
        else
          return_status = "Not Started."
        end
        all_sections_complete = true
        self.sections.each do |section|
          if (section.attempts.where(user_id: user_id, passed: true).empty?)
            all_sections_complete = false
          end
        end
        if (all_sections_complete)
          return_status = "Quiz".pluralize(self.sections.count) + " Complete."
        end
      end
    end
    return_status
  end

end
