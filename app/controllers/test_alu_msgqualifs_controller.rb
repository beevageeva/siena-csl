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
		qans = []
		cms.each do |cm|
			if !res.has_key?(cm.from_id)
				res[cm.from_id] = {firstAnsQ: 0, respQ: 0}
			end
			if(cm.grouptest_chatmessages[0].qnumber!=lastqnumber)
				lastqnumber = cm.grouptest_chatmessages[0].qnumber
				qans.each do |from_id_qans|
					res[from_id_qans][:respQ]+=1
				end	
				qans.clear
				res[cm.from_id][:firstAnsQ]+=1
			end
			if !qans.include?(cm.from_id)
				qans.push(cm.from_id)
			end	
			
		end  #cms.each
		test = Test.find(params[:test_id])
		grade3 = ((test.correctAnswers.to_f / test.answers.size)*3.0).ceil
		#ActiveRecord::Base.logger.warn("WHY? ca = #{test.correctAnswers}  , ta = #{test.answers.size} , mult3 = #{(test.correctAnswers.to_f / test.answers.size)*3.0}, ceil is = #{grade3}")
		#TODO is 1 the min?
		grade3=1 if grade3==0	
		#ActiveRecord::Base.logger.warn("res = #{res.to_s}")
		params[:rel] and params[:rel].each do |sid , gr|
			if gr
				tam = TestAluMsgqualif.find_by_test_id_and_student_id(params[:test_id], sid)
				if tam.nil?
					#ActiveRecord::Base.logger.warn("!!!!!!!!!!!!!!from_id = #{sid}")
					#TODO is 1 the min ?
					grade1 = 1
					grade2 = 1
					sid = sid.to_i
					if(res.has_key?(sid))
						#ActiveRecord::Base.logger.warn("!!!!!!!!!!!!!WHY? firstAnsQ = #{res[sid][:firstAnsQ]}  ,ta = #{test.answers.size} , respQ = #{res[sid][:respQ]} ")
						grade1 =  ((res[sid][:firstAnsQ].to_f/test.answers.size)*3.0).ceil
						grade2 = ((res[sid][:respQ].to_f/test.answers.size)*3.0).ceil
					end
		 			#ActiveRecord::Base.logger.warn("grade3 = #{grade3}")
					tam = TestAluMsgqualif.new({test_id: params[:test_id], student_id: sid, grade1: grade1, grade2: grade2, grade3: grade3} )
				end	
				tam.grade4 = gr
				tam.grade_total = calculateFuzzyTotalGrade(tam.grade1, tam.grade2, tam.grade3, tam.grade4)
				#ActiveRecord::Base.logger.warn("before saving  gr1=#{tam.grade1}, gr2=#{tam.grade2}, gr3=#{tam.grade3}, gr4=#{tam.grade4},grTotal=#{tam.grade_total}" ) 
				if tam.save
					nCreated+=1
				else
					
					ActiveRecord::Base.logger.warn("errors saving  #{tam.errors.full_messages}" ) if tam.errors
				end
			end
		end			
		@message = "#{nCreated} updated at #{Time.now.strftime("%Y-%d-%m %H:%M:%S")}"
		@test_alu_msgqualifs = TestAluMsgqualif.where(test_id: params[:test_id])	
	end


private
	#TODO now it is in a file, move it to db?
	def calculateFuzzyTotalGrade(g1,g2,g3,g4)
		regexp = /\s*#{g1}\s+#{g2}\s+#{g3}\s+#{g4}\s+(\d)\s*/
		File.open(Rails.root.join('files','fuzzy_list')).each do |li|
  		return $1 if regexp.match(li)
		end
		return 0
	end


end
