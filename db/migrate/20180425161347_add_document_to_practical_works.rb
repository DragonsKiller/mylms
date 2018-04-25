class AddDocumentToPracticalWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :practical_works, :document, :string
  end
end
