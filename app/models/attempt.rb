class Attempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :section
  has_many :results, dependent: :destroy
end