class ChatsController < ApplicationController



 before_filter(:only => [:connect,:receivemessages, :sendmailtoteachers, :invite, :sendmessage, :showLastMessages ] ) { |c| c.auth  [ {:types =>  [User::ALU]} ]  }

NUMBER_SECONDS_DUPLICATE_SESSION = 10
NUMBER_MESSAGES_LAST = 3
MAX_NUMBER_MESSAGES_RECEIVE = 20

def connect
	res = Hash.new 
	res['username'] = User.find(session[:userid]).username 
	render :json => res.to_json
end 


def invite
	test = Test.find(params[:test_id])
	test.work.assignedto.online_nottesting_students(test.id).each do |s|
		ChatMessage.create(:from_id => session[:useraccount_id], :to_id => s.id, :msgtype => ChatMessage::MSGTYPE_STARTTEST, :body => test.id )
	end
	render :json => {:error =>  false}
end


def showLastmessages
	alu_group_id = params[:alu_group_id].to_i
	chatmessages = ChatMessage.where("msgtype = ? AND body LIKE '?:%'", ChatMessage::MSGTYPE_CHAT, alu_group_id).order("max(created_at) DESC").limit(NUMBER_MESSAGES_LAST).select("from_id, body").group("from_id, body")
	#ActiveRecord::Base.logger.warn("chatmessages sql")
	#ActiveRecord::Base.logger.warn(chatmessages.to_sql)
	
	chatmessages.each do |msg|
		addChatMessageAttr(msg)
		msg["from_name"] = Student.find(msg[:from_id]).user.username
		msg["msgtype"] = ChatMessage::MSGTYPE_CHAT
	end
	response = chatmessages.reverse.to_json(:except => [:from_id,:to_id])
	#ActiveRecord::Base.logger.warn("chatmessages json:")
	#ActiveRecord::Base.logger.warn(response)

	render :json => response	
end


def sendmailtoteachers
	course = Course.find(params[:courseid])
	emails = course.teachers.map{|t| t.user.email}
	message = params[:body]
	return  if message.nil? || message == ""	
	#ActiveRecord::Base.logger.warn("sending messages")
	#ActiveRecord::Base.logger.warn(emails)
	Notifier.student_question_to_teachers(emails,message, User.find(session[:userid]).name, course.name ).deliver
	render :json => {:error =>  false}
end


#send chat messages 
def sendmessage
	return if session[:userid].nil?
	#ActiveRecord::Base.logger.warn "SENDMESSAGE"
	if(params[:to].nil?)
		ActiveRecord::Base.logger.warn "params[:to] nil in sendmessage"
		return
	end
	alugroup = AluGroup.find(params[:to])
	current_student = User.find(session[:userid]).useraccount
	registered_tests =  current_student.registered_tests.map{|ct| {:test_id => ct.id , :qnumber => ct.answers.size}}

	alugroup.students.each do |s|
		if s.id != session[:useraccount_id]
			if chatmessage = ChatMessage.create(:from_id => session[:useraccount_id], :to_id => s.id, :msgtype => ChatMessage::MSGTYPE_CHAT, :body =>  [alugroup.id.to_s , alugroup.name , params[:message]].join(":"))
				GrouptestChatmessage.create(registered_tests.map {|ct|  ct.merge(:chat_message_id => chatmessage.id)}) if registered_tests.size > 0 
			end
		end
	end		
	render :json => {:error =>  false}
end






def receivemessages
	return if session[:userid].nil?
	student_id = session[:useraccount_id]
	Student.update(student_id, {:lastcheck => Time.now})
	chat_messages = ChatMessage.arel_table
	session_chatmessages = SessionChatmessage.arel_table
	newmessages_session_condition= SessionChatmessage.where(session_chatmessages[:chat_message_id].eq(chat_messages[:id]).and(session_chatmessages[:sessionid].eq(session[:session_id]))).exists.not
	#last 10 sec messages
	lastmsgs_condition = chat_messages[:created_at].gt(Time.at(Time.now.to_i - NUMBER_SECONDS_DUPLICATE_SESSION))
	newmessages_condition= SessionChatmessage.where(session_chatmessages[:chat_message_id].eq(chat_messages[:id])).exists.not
	newmessages = ChatMessage.where(chat_messages[:to_id].eq(student_id).and(lastmsgs_condition.and(newmessages_session_condition).or(newmessages_condition))).limit(MAX_NUMBER_MESSAGES_RECEIVE)	
	#ActiveRecord::Base.logger.warn("******************************SQL")
	#ActiveRecord::Base.logger.warn(newmessages.to_sql)
	# SELECT "chat_messages".* FROM "chat_messages" WHERE ("chat_messages"."to_id" = 340 AND ("chat_messages"."created_at" > '2012-10-19 20:26:22.000000' AND NOT (EXISTS (SELECT "session_chatmessages".* FROM "session_chatmessages" WHERE ("session_chatmessages"."chat_message_id" = "chat_messages"."id" AND "session_chatmessages"."sessionid" = '97bf0f040ec1935a145b89a9dc36f463'))) OR NOT (EXISTS (SELECT "session_chatmessages".* FROM "session_chatmessages" WHERE "session_chatmessages"."chat_message_id" = "chat_messages"."id"))))

	newmessages.each do |newmsg|
		begin
			case newmsg.msgtype
				when ChatMessage::MSGTYPE_CHAT
					addChatMessageAttr(newmsg)
				when ChatMessage::MSGTYPE_STARTTEST
					test=Test.find(newmsg[:body])
					newmsg[:node_name] = test.work.node.content
					newmsg[:alu_group_name] = test.work.assignedto.name
		end
		newmsg[:from_name] = Student.find(newmsg.from_id).user.username 
		rescue Exception=>e
			ActiveRecord::Base.logger.warn("receive message error")
			ActiveRecord::Base.logger.warn(e)
			newmessages.delete(newmsg)
		end
	end
	insertarray = newmessages.map{|nm| {:sessionid => session[:session_id] , :chat_message_id => nm.id } }
	
	#ActiveRecord::Base.logger.warn("******************************INSERT ARRAY")
	#ActiveRecord::Base.logger.warn(insertarray)
	SessionChatmessage.create(insertarray) if insertarray.size > 0 
	render :json => newmessages.to_json(:except => [:from_id,:to_id])
end

private
	def addChatMessageAttr(newmsg)
		bodyparts = newmsg[:body].split(":",3)
		newmsg[:alu_group_id] = bodyparts[0]
		newmsg[:alu_group_name] = bodyparts[1]
		newmsg[:body] = bodyparts[2]

	end
	





end
