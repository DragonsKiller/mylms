class Subgroup < ApplicationRecord
  belongs_to :group
  has_many :students
  has_many :classes_timetables
end
