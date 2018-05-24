class AcademicPlan < ApplicationRecord
  belongs_to :semester
  belongs_to :subject

  has_many :laboratory_works
  has_many :students, through: :laboratory_works
  has_many :teachers, through: :laboratory_works

  has_many :practical_works
  has_many :students, through: :practical_works
  has_many :teachers, through: :practical_works

  def name
    if !self.id.nil?
      self.semester.id.to_s + ' ' + self.subject.name
    end
  end
end
