class CreateAcademicPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :academic_plans do |t|
      t.references :semester, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
