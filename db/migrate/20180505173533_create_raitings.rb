class CreateRaitings < ActiveRecord::Migration[5.1]
  def change
    create_table :raitings do |t|

      t.timestamps
    end
  end
end
