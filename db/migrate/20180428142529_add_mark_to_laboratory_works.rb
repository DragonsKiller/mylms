class AddMarkToLaboratoryWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :laboratory_works, :mark, :integer
  end
end
