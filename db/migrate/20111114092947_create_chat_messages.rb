class CreateChatMessages < ActiveRecord::Migration
  def self.up
    create_table :chat_messages do |t|
      t.integer :from_id
      t.integer :to_id
      t.text :body
      t.integer :msgtype

      t.timestamps
    end
  end

  def self.down
    drop_table :chat_messages
  end
end
