class AddStudentAndAcademicPlanAndTeacherToPracticalWorks < ActiveRecord::Migration[5.1]
  def change
    add_reference :practical_works, :student, foreign_key: true
    add_reference :practical_works, :academic_plan, foreign_key: true
    add_reference :practical_works, :teacher, foreign_key: true
  end
end
