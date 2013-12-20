class Ceu < ActiveRecord::Base
  belongs_to :course

  def full_ceu_name
    "#{self.credit} #{self.name} Credit".pluralize(self.credit) + " - #{self.organization}"
  end
end
