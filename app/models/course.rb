class Course < ActiveRecord::Base
  before_save :update_slug

  has_many :sections, dependent: :destroy
  has_many :videos, through: :sections
  has_many :quizzes, through: :sections
  accepts_nested_attributes_for :sections, allow_destroy: true
  has_many :certificates

  def update_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end

  # return status of N/A, Not Started, In Progress, Completed, Certificate Purchased
  def my_status(user_id)
    return_status = "N/A"
    if (!self.sections.empty?)
      return_status = "Quiz Not Completed"
    end

    if (!self.certificates.where(user_id: user_id).empty?)
        return_status = "Certificate Purchased"
    end
    return_status
  end

end
