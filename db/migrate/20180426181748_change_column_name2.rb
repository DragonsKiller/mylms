class ChangeColumnName2 < ActiveRecord::Migration[5.1]
  def change
    rename_column :teachers, :midle_name, :last_name
  end
end
