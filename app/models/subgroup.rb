class Subgroup < ApplicationRecord
  belongs_to :group
  has_many :students
end
