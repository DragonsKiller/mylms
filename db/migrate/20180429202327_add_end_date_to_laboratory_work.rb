class AddEndDateToLaboratoryWork < ActiveRecord::Migration[5.1]
  def change
    add_column :laboratory_works, :end_date, :date
  end
end
