class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :subgroup
  has_many :brigade_memberships
  has_many :brigades, through: :brigade_memberships

  has_many :students_project_memberships
  has_many :projects, through: :students_project_memberships

  has_many :laboratory_works
  has_many :teachers, through: :laboratory_works

  has_many :laboratory_works
  has_many :academic_plans, through: :laboratory_works
end
