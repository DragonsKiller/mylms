class Classroom < ApplicationRecord
  belongs_to :campus
  has_many :lessons
end
