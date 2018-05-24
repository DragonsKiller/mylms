class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teachers_project_memberships
  has_many :projects, through: :teachers_project_memberships

  has_many :laboratory_works
  has_many :students, through: :laboratory_works
  has_many :academic_plans, through: :laboratory_works

  has_many :practical_works
  has_many :students, through: :practical_works
  has_many :academic_plans, through: :practical_works

  has_many :lessons

  delegate :last_name, to: :lessons, prefix: true

  def name
    if !self.id.nil?
      self.last_name+' '+self.first_name+' '+self.second_name
    end
  end
end
