class Certificate < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  before_save :update_slug

  def update_slug
    #self.slug = (User.find(self.user_id).name+ "-" + Course.find(self.course_id).name).parameterize
    self.id
  end

  def to_param
    self.slug
  end 
end
