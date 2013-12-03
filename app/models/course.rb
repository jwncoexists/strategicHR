class Course < ActiveRecord::Base
  before_save :update_slug

  def update_slug
    self.slug = self.name.parameterize
  end

  def to_param
    self.slug
  end
end
