class AddDocumentToLaboratoryWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :laboratory_works, :document, :string
  end
end
