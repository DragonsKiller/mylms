class ClassesTimetable < ApplicationRecord
  belongs_to :semester
  belongs_to :subgroup
  has_many :lessons
end
