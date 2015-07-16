class TestAluMsgqualifsController < ApplicationController
 before_filter(:only => [:setGrades] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }

	#no layout, using only ajax calls
	#layout :green_web

	def setGrades
		#ActiveRecord::Base.logger.warn("params rel #{params[:rel]}" )
		nCreated = 0
		#TODO if it remains here delete comments in spelling_corrector	
		cms = ChatMessage.joins(:grouptest_chatmessages).includes(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => params[:test_id]}).order("chat_messages.created_at").uniq_by {|c| [c.body, c.from_id, c.grouptest_chatmessages[0].qnumber]}
		lastqnumber = 0
		res = {}
		cms.each do |cm|
			if !res.has_key?(cm.from_id)
				res[cm.from_id] = {firstAnsQ: 0, respQ: 0}
			end
			if(cm.grouptest_chatmessages[0].qnumber!=lastqnumber)
				lastqnumber = cm.grouptest_chatmessages[0].qnumber
			end
			
		end


		ActiveRecord::Base.logger.warn("SIZE IS #{cms.size}")
		params[:rel] and params[:rel].each do |sid , gr|
			if gr
				tam = TestAluMsgqualif.find_by_test_id_and_student_id(params[:test_id], sid)
				if tam.nil?
					tam = TestAluMsgqualif.new({test_id: params[:test_id], student_id: sid})
				end	
				tam.grade4 = gr
				if tam.save
					nCreated+=1
				else
					
					ActiveRecord::Base.logger.warn("errors saving  #{tam.errors.full_messages}" ) if tam.errors
				end
			end
		end			
		@message = "#{nCreated} updated at #{Time.now.strftime("%Y-%d-%m %H:%M:%S")}"	
	end


end
