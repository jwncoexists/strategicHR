class Course < ActiveRecord::Base
  before_save :update_slug

  has_many :sections, dependent: :destroy
  has_many :videos, through: :sections
  has_many :quizzes, through: :sections
  accepts_nested_attributes_for :sections, allow_destroy: true
  has_many :course_statuses
  accepts_nested_attributes_for :course_statuses
  has_many :section_statuses
  accepts_nested_attributes_for :section_statuses

  def update_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end

  # return course status of N/A, Not Started, In Progress, Completed, Certificate Purchased
  def my_status(user_id)
    return_status = "N/A"
    if (!self.sections.empty?)
      return_status = "Not Started"
    end

    all_sections_completed = false
    sections_stats = self.section_statuses.where(user_id: user_id)
    
    if (!sections_stats.empty?)
      return_status = "In Progress"
      all_sections_completed = true
      sections_stats.each do |section_stat|
        all_sections_completed &&= section_stat.completed_quiz
      end
    end
    if (all_sections_completed)
      return_status = "Quizzes Completed"
    end

    course_stat = self.course_statuses.where(user_id: user_id)
    if (!course_stat.empty?)
      course_stat = course_stat.first
      if(course_stat.purchased_certificate)
        return_status = "Certificate Purchased"
      end
    end
    return_status
  end

  def section_status(user_id, section_id)
    return_status = "Not Started"
    section_stat = Section.where(user_id: user_id, section_id: section_id)
    if (!section_stat.empty?)
      if (section_stat.completed_quiz)
        return_stat = 'Quiz Completed'
      end
    end
    return_status
  end
end
