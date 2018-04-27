class AddBrigadeAdminIdToBrigades < ActiveRecord::Migration[5.1]
  def change
    add_column :brigades, :brigade_admin_id, :integer
  end
end
