class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.text :body
      t.references :conversation, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
