class AcademicPlan < ApplicationRecord
  belongs_to :semester
  belongs_to :subject

  has_many :laboratory_works
  has_many :students, through: :laboratory_works

  has_many :laboratory_works
  has_many :teachers, through: :laboratory_works
end
