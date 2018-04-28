class Project < ApplicationRecord
  has_many :students_project_memberships, dependent: :destroy
  has_many :students, through: :students_project_memberships

  has_many :teachers_project_memberships, dependent: :destroy
  has_many :teachers, through: :teachers_project_memberships
end
