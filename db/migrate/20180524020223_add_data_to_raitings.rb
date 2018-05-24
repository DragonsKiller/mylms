class AddDataToRaitings < ActiveRecord::Migration[5.1]
  def change
    add_column :raitings, :data, :text
  end
end
