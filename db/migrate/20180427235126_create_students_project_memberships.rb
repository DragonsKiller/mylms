class CreateStudentsProjectMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :students_project_memberships do |t|
      t.references :student, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
