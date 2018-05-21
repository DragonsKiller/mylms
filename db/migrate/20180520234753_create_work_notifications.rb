class CreateWorkNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :work_notifications do |t|

      t.timestamps
    end
  end
end
