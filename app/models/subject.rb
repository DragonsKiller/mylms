class Subject < ApplicationRecord
  has_many :academic_plans
  has_many :semesters, through: :academic_plans
end
