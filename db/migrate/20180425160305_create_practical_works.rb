class CreatePracticalWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :practical_works do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
