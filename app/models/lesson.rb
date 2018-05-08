class Lesson < ApplicationRecord
  belongs_to :classes_timetable
  belongs_to :subject
  belongs_to :teacher
  belongs_to :classroom
end
