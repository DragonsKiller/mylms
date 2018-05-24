class Classroom < ApplicationRecord
  belongs_to :campus
  has_many :lessons

  def name
    if !self.id.nil?
      self.number
    end
  end
end
