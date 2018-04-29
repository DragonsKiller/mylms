class AddEndDateToPracticalWork < ActiveRecord::Migration[5.1]
  def change
    add_column :practical_works, :end_date, :date
  end
end
