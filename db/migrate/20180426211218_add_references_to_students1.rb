class AddReferencesToStudents1 < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :subgroup, foreign_key: true
  end
end
