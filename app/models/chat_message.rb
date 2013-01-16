class ChatMessage < ActiveRecord::Base
#TODO polymorphic ?


	attr_accessible :from_id, :to_id, :body, :msgtype


	belongs_to :test

	belongs_to :from , :class_name => "Student"
        belongs_to :to , :class_name => "Student"
	
	has_many :grouptest_chatmessages, :dependent => :delete_all


	MSGTYPE_CHAT = 1
	MSGTYPE_STARTTEST = 2
	MSGTYPE_ANSWER = 3
	MSGTYPE_REASSIGNUSER = 4

end
