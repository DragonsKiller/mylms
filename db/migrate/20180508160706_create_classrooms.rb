class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :number
      t.references :campus, foreign_key: true

      t.timestamps
    end
  end
end
