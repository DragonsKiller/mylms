class BrigadeMembership < ApplicationRecord
  belongs_to :student
  belongs_to :brigade

  def name
    if !self.id.nil?
      self.student.last_name+' '+self.student.first_name+' '+self.student.second_name
    end
  end
end
