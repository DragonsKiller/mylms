class ChangeColumnName3 < ActiveRecord::Migration[5.1]
  def change
    rename_column :students, :student_id, :st_id
  end
end
