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
		grade3 = (test.correctAnswers.to_f / test.answers.size)
		#ActiveRecord::Base.logger.warn("WHY? ca = #{test.correctAnswers}  , ta = #{test.answers.size} , mult3 = #{(test.correctAnswers.to_f / test.answers.size)*3.0}, ceil is = #{grade3}")
		#ActiveRecord::Base.logger.warn("res = #{res.to_s}")
		@message = ""
		params[:rel] and params[:rel].each do |sid , gr|
			if gr
				tam = TestAluMsgqualif.find_by_test_id_and_student_id(params[:test_id], sid)
				if tam.nil?
					#ActiveRecord::Base.logger.warn("!!!!!!!!!!!!!!from_id = #{sid}")
					sid = sid.to_i
					if(res.has_key?(sid))
						#ActiveRecord::Base.logger.warn("!!!!!!!!!!!!!WHY? firstAnsQ = #{res[sid][:firstAnsQ]}  ,ta = #{test.answers.size} , respQ = #{res[sid][:respQ]} ")
						grade1 =  res[sid][:firstAnsQ].to_f/test.answers.size
						grade2 = res[sid][:respQ].to_f/test.answers.size
					end
		
		 			#ActiveRecord::Base.logger.warn("grade3 = #{grade3}")
					tam = TestAluMsgqualif.new({test_id: params[:test_id], student_id: sid, grade1: grade1, grade2: grade2, grade3: grade3} )
				end	
				tam.grade4 = gr
				res = calculateFuzzyTotalGrade(tam.grade1, tam.grade2, tam.grade3, tam.grade4)
				tam.grade_total = res[0]
				@message<<res[1]
				#ActiveRecord::Base.logger.warn("before saving  gr1=#{tam.grade1}, gr2=#{tam.grade2}, gr3=#{tam.grade3}, gr4=#{tam.grade4},grTotal=#{tam.grade_total}" ) 
				if tam.save
					nCreated+=1
				else
					
					ActiveRecord::Base.logger.warn("errors saving  #{tam.errors.full_messages}" ) if tam.errors
				end
			end #gr not nil
		end	#each end		
		@message << "\n#{nCreated} updated at #{Time.now.strftime("%Y-%d-%m %H:%M:%S")}"
		@test_alu_msgqualifs = TestAluMsgqualif.where(test_id: params[:test_id])	
	end


private
	def calculateFuzzyTotalGrade(g1,g2,g3,g4)
		def fuzzyZone(n)
			res = []
			if n < 0.34
				res.push(1)
			end
			if 0.1 < n && n < 0.9
				res.push(2)
			end	
			if n > 0.66
				res.push(3)
			end
			return res
		end
		#TODO maybe make an sql avg
		details = ""
		n = 0
		sum = 0.0
		FuzzyRule.where(g1: fuzzyZone(g1), g2: fuzzyZone(g2), g3: fuzzyZone(g3), g4: fuzzyZone(g4)).each do |fr|
			details << "#{fr.g1}, #{fr.g1},#{fr.g1},#{fr.g1} -> #{fr.gres} | "
			sum+=fr.gres
			n+=1
		end
		r1 = 0.0
		if n == 0
			ActiveRecord::Base.logger.warn("No fuzzy rule for input:  #{g1}, #{g2}, #{g3}, #{g4}" )
		else
			r1 = sum/(n*3) #the grades in fuzzy rules are 1 to 3 and we need in [0,1] interval
		end
		details<<"*#{"%5.3f" % r1}*"
		return [r1, details]
	end
		

end
