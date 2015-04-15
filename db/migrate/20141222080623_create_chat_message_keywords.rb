class CreateChatMessageKeywords < ActiveRecord::Migration
  def change
    create_table :chat_message_keywords do |t|
      t.references :chat_message, index: true
      t.references :question, index: true
      t.string :keyword
      t.string :previous

      t.timestamps
    end
  end
end
