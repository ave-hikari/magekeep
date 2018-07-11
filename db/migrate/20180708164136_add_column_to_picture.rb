class AddColumnToPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :user_id, :integer
    add_index :pictures, [:id, :user_id]
  end
end
