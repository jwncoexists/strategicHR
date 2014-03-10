class Ceu < ActiveRecord::Base
  belongs_to :course
  belongs_to :certificate
  default_scope order('id ASC')

  def full_ceu_name
    "#{self.credit} #{self.name} Credit".pluralize(self.credit) + " - #{self.organization}"
  end
  def full_ceu_name_no_org
    "#{self.credit} #{self.name} Credit".pluralize(self.credit)
  end
end
