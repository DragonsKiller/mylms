class TeachersProjectMembership < ApplicationRecord
  belongs_to :teacher
  belongs_to :project

  def name
    if !self.id.nil?
      self.teacher.last_name+' '+self.teacher.first_name+' '+self.teacher.second_name
    end
  end
end
