class ChangeColumnNameInConversations < ActiveRecord::Migration[5.0]
  def change
    rename_column :conversations, :snder_id, :user_id
  end
end
