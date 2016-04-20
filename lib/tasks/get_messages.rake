namespace :get_messages do
	desc 'test'
	#TODO execute in the db: why this happens when dependent => destroy in model work????
	#delete from tests t where not exists (select *  from works w where w.id = t.work_id); 
	task :test => :environment do
		test_id = 34174
		
		test = Test.find(test_id)
		
		
		
		  answers = test.answers
		  puts("answers size = #{answers.size}")
		
		
		
		  ChatMessage.joins(:grouptest_chatmessages).includes(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => test.id}).order("chat_messages.created_at").uniq_by {|c| [c.body, c.from_id, c.grouptest_chatmessages[0].qnumber]}.each do |cm|
		
		    puts("qnumber = #{cm.grouptest_chatmessages[0].qnumber}")
		    if(cm.grouptest_chatmessages[0].qnumber<answers.size )
		      question_id = answers[cm.grouptest_chatmessages[0].qnumber].question_id
					question = Question.find(question_id)
					messagebody = cm.body.split(":",3)[2]
					puts(question.content, messagebody)		
				end	
		
			end	
	end

	task :default do
		puts "Hello World!"
	end

end
