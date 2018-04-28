class Semester < ApplicationRecord
  has_many :academic_plans
  has_many :subjects, through: :academic_plans
end
