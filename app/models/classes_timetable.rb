class ClassesTimetable < ApplicationRecord
  belongs_to :semester
  belongs_to :subgroup
  has_many :lessons

  def name
    if !self.id.nil?
      self.semester.id.to_s + ' ' + self.subgroup.name
    end
  end
end
