class CreateTeachersProjectMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers_project_memberships do |t|
      t.references :teacher, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
