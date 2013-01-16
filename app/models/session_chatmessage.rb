class SessionChatmessage < ActiveRecord::Base

attr_accessible :sessionid, :chat_message_id

	belongs_to :chat_message

end
