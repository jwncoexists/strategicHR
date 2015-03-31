class Resource < ActiveRecord::Base
  belongs_to :course
  default_scope order('id ASC')
  mount_uploader :image, ImageUploader

end
