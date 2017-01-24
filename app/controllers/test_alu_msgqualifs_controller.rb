class TestAluMsgqualifsController < ApplicationController
 before_filter(:only => [:setGrades] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }

	#no layout, using only ajax calls
	#layout :green_web

	def setGrades
		#ActiveRecord::Base.logger.warn("params rel #{params[:rel]}" )
		nCreated = 0
		#TODO if it remains here delete comments in spelling_corrector	
		#cms = ChatMessage.joins(:grouptest_chatmessages).includes(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => params[:test_id]}).order("chat_messages.created_at").uniq{|c| "#{c.body},#{c.from_id},#{c.grouptest_chatmessages[0].qnumber}"}
		cms = ChatMessage.joins(:grouptest_chatmessages).includes(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => params[:test_id]}).order("chat_messages.created_at").distinct("chat_messages.body,chat_messages.from_id,grouptest_chatmessages.qnumber,chat_messages.created_at")
		lastqnumber = 0
		res = {}
		qans = []
		cms.each do |cm|
			#ActiveRecord::Base.logger.warn "*************START CM **********************"
			#ActiveRecord::Base.logger.warn cm
			#ActiveRecord::Base.logger.warn "*************END CM **********************"
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
		#ActiveRecord::Base.logger.warn "*** RES ---------------"
		#ActiveRecord::Base.logger.warn res
		#ActiveRecord::Base.logger.warn "*** RES END ---------------"
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
				resF = calculateFuzzyTotalGrade(tam.grade1, tam.grade2, tam.grade3, tam.grade4)
				tam.grade_total = resF[0]
				@message<<resF[1]
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
		ActiveRecord::Base.logger.warn("calculateFuzzyTotalGrade:  #{g1}, #{g2}, #{g3}, #{g4}" )
		def fuzzyZone(n)
			res = [[],[]]
			if n < 0.34
				res[0].push(1)
				res[1].push([1.0- ((n-0.17)/0.17).abs, 0.01].max  )
			end
			if 0.1 < n && n < 0.9
				res[0].push(2)
				res[1].push([1.0 - ((n-0.5)/0.4).abs, 0.01].max)
			end	
			if n > 0.66
				res[0].push(3)
				res[1].push([1.0- ((n-0.83)/0.17).abs, 0.01].max)
			end
		ActiveRecord::Base.logger.warn "*** FUZZY ---------------"
		ActiveRecord::Base.logger.warn res
		ActiveRecord::Base.logger.warn "*** FUZZY END ---------------"
			return res
		end
		#TODO maybe make an sql avg
		details = ""
		#no more avg, weighted by min, same initiatlization here
		n = 0
		sum = 0.0
		details << "<a style=\"color:#80BFFF\">#{"%5.2f" % g1},#{"%5.2f" % g2},#{"%5.2f" % g3},#{"%5.2f" % g4}</a><br/>"
		f1 = fuzzyZone(g1)
		f2 = fuzzyZone(g2)
		f3 = fuzzyZone(g3)
		f4 = fuzzyZone(g4)

		for i in 0..f1[0].length-1
		for j in 0..f2[0].length-1
		for k in 0..f3[0].length-1
		for l in 0..f4[0].length-1

		FuzzyRule.where(g1: f1[0][i], g2: f2[0][j], g3: f3[0][k], g4: f4[0][l]).each do |fr|
			w = [f1[1][i], f2[1][j], f3[1][k], f4[1][l]].min
			details << "#{fr.g1} * #{"%5.2f" %  f1[1][i]}, 
#{fr.g2} * #{"%5.2f" %  f2[1][j]},
#{fr.g3} * #{"%5.2f" %  f3[1][k]},
#{fr.g4} * #{"%5.2f" %  f4[1][l]} -> #{fr.gres} * #{"%5.2f" %  w} <br/> "
			#no more avg, weighted by min, same initiatlization here
			#sum+=fr.gres
			#n+=1
			sum+=fr.gres * w
			n+=w
		end

		end
		end
		end
		end

		r1 = 0.0
		if n == 0
			ActiveRecord::Base.logger.warn("No fuzzy rule for input:  #{g1}, #{g2}, #{g3}, #{g4}" )
		else
			r1 = sum/(n*3) #the grades in fuzzy rules are 1 to 3 and we need in [0,1] interval
		end
		details<<"<b> #{"%5.3f" % r1} </b><br/>"
		return [r1, details]
	end
		

end
