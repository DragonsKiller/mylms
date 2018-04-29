class AddLoadDateToLaboratoryWork < ActiveRecord::Migration[5.1]
  def change
    add_column :laboratory_works, :load_date, :date
  end
end
