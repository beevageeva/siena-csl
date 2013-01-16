class CreateSessionChatmessages < ActiveRecord::Migration
  def self.up
    create_table :session_chatmessages do |t|

			t.references :chat_message
			t.string :sessionid
      			t.timestamps
    end
  end

  def self.down
    drop_table :session_chatmessages
  end
end
