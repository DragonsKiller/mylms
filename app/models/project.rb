class Project < ApplicationRecord
  has_many :students_project_memberships, dependent: :destroy
  has_many :students, through: :students_project_memberships
end
