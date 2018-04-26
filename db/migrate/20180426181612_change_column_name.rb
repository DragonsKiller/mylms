class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :students, :midle_name, :last_name
  end
end
