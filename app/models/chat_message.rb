class ChatMessage < ActiveRecord::Base
#TODO polymorphic ?


	#belongs_to :test

	belongs_to :from , :class_name => "Student"
        belongs_to :to , :class_name => "Student"
	
	has_many :grouptest_chatmessages, :dependent => :delete_all


	MSGTYPE_CHAT = 1
	MSGTYPE_STARTTEST = 2
	MSGTYPE_ANSWER = 3
	MSGTYPE_REASSIGNUSER = 4

end
