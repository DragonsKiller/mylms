class Student < ApplicationRecord
  acts_as_target
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
  has_many :academic_plans, through: :laboratory_works

  has_many :practical_works
  has_many :teachers, through: :practical_works
  has_many :academic_plans, through: :practical_works

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  def name
    if !self.id.nil?
      self.last_name+' '+self.first_name+' '+self.second_name
    end
  end
end
