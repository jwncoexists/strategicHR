class Course < ActiveRecord::Base
  before_save :update_slug

  has_many :sections, dependent: :destroy
  has_many :videos, through: :sections
  has_many :quizzes, through: :sections
  accepts_nested_attributes_for :sections, allow_destroy: true

  def update_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end
end
