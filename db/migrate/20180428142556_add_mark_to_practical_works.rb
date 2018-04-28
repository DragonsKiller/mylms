class AddMarkToPracticalWorks < ActiveRecord::Migration[5.1]
  def change
    add_column :practical_works, :mark, :integer
  end
end
