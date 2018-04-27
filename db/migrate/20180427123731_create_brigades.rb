class CreateBrigades < ActiveRecord::Migration[5.1]
  def change
    create_table :brigades do |t|
      t.string :name

      t.timestamps
    end
  end
end
