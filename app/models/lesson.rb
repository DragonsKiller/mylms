class Lesson < ApplicationRecord
  belongs_to :classes_timetable
  belongs_to :subject
  belongs_to :teacher
  belongs_to :classroom

  def name
    if !self.id.nil?
      self.lesson_type + ' ' + self.subject.name + ' ' + self.teacher.last_name  + ' ' + self.classroom.number + ' ' + self.lesson_date.to_s + ' ' + self.lesson_time.to_s
    end
  end
end
