class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :conversations, :recipient_id, :consultant_id
  end
end
