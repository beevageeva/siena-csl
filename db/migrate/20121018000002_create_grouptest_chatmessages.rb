class CreateGrouptestChatmessages < ActiveRecord::Migration
  def self.up
    create_table :grouptest_chatmessages do |t|

			t.references :test
			t.references :chat_message
		  	t.integer :qnumber
      			t.timestamps
    end
  end

  def self.down
    drop_table :grouptest_chatmessages
  end
end
