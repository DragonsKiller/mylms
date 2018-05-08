class CreateClassesTimetables < ActiveRecord::Migration[5.1]
  def change
    create_table :classes_timetables do |t|
      t.references :semester, foreign_key: true
      t.references :subgroup, foreign_key: true

      t.timestamps
    end
  end
end
