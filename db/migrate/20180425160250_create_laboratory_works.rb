class CreateLaboratoryWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :laboratory_works do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
