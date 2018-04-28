class AddStudentAndAcademicPlanAndTeacherToLaboratoryWorks < ActiveRecord::Migration[5.1]
  def change
    add_reference :laboratory_works, :student, foreign_key: true
    add_reference :laboratory_works, :academic_plan, foreign_key: true
    add_reference :laboratory_works, :teacher, foreign_key: true
  end
end
