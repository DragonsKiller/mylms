class CreateBrigadeMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :brigade_memberships do |t|
      t.references :student, foreign_key: true
      t.references :brigade, foreign_key: true

      t.timestamps
    end
  end
end
