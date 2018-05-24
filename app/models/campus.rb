class Campus < ApplicationRecord
  has_many :classrooms

  def name
    if !self.id.nil?
      self.id
    end
  end
end
