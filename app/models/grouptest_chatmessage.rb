class GrouptestChatmessage < ActiveRecord::Base


	belongs_to :chat_message
	belongs_to :test

end
