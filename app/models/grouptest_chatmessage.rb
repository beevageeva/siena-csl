class GrouptestChatmessage < ActiveRecord::Base

attr_accessible :chat_message_id, :test_id, :qnumber	

	belongs_to :chat_message
	belongs_to :test

end
