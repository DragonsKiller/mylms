class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :type
      t.date :lesson_date
      t.time :lesson_time
      t.references :classes_timetable, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
