namespace :get_messages do
	desc 'test'
	#TODO execute in the db: why this happens when dependent => destroy in model work????
	#delete from tests t where not exists (select *  from works w where w.id = t.work_id); 
	task :test => :environment do
		test_id = 32428
		
		test = Test.find(test_id)
		
		
		
		  answers = test.answers
		
		
			puts test.work.node.content
			puts("content;message\n")
		
		  ChatMessage.joins(:grouptest_chatmessages).includes(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => test.id}).order("chat_messages.created_at").uniq_by {|c| [c.body, c.from_id, c.grouptest_chatmessages[0].qnumber]}.each do |cm|
	

	
		    if(cm.grouptest_chatmessages[0].qnumber<answers.size )
		      question_id = answers[cm.grouptest_chatmessages[0].qnumber].question_id
					question = Question.find(question_id)
					messagebody = cm.body.split(":",3)[2]
					qr = question.question_responses.map{|q| q.response }.join(" ")
					#puts("#{test.work.node.content} #{question.content} #{qr};#{messagebody}\n" )		
					puts("#{question.content.gsub(/\s/, " ")} #{qr};#{messagebody}\n" )		
				end	
		
			end	
	end

	task :default do
		puts "Hello World!"
	end

end
