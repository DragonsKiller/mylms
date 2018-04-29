class AddLoadDateToPracticalWork < ActiveRecord::Migration[5.1]
  def change
    add_column :practical_works, :load_date, :date
  end
end
