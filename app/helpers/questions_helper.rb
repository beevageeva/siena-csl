module QuestionsHelper

	def adminQN(q)
		User.find(session[:userid]).useraccount_type == User::ADMIN || q.teacher.user.id == session[:userid]
	end


	def getNewPoints(lastP, lastQDif, lastQLuck, correctAnswer)
		ActiveRecord::Base.logger.info "question luck = #{lastQLuck},dif = #{lastQDif}, lastP=#{lastP}, correctAnswer=#{correctAnswer}"
		if correctAnswer
	    first = (1.0-lastQDif) * lastP
	    second = first + (1.0 - lastP) *  lastQLuck
	    newLastP = second == 0 ? 1 : (first / second)
			if newLastP >=1
				ActiveRecord::Base.logger.info "newLastP >=1 "
				return 1
			end	
			#if dif < luck -- points will go down
			if newLastP < lastP
				ActiveRecord::Base.logger.info "question luck = #{lastQLuck},dif = #{lastQDif}, lastP=#{lastP} , fisrt = #{first}, second = #{second}, newLastP = #{newLastP}, correctAnswer=#{correctAnswer}"
				return lastP
			end	
	  else 
	    first = lastQDif * lastP
	    second = first + (1 - lastP) *  (1.0-lastQLuck)
	    newLastP = second == 0 ? 1 : (first / second)
			if newLastP > lastP
				ActiveRecord::Base.logger.info "question luck = #{lastQLuck},dif = #{lastQDif}, lastP=#{lastP} , fisrt = #{first}, second = #{second}, newLastP = #{newLastP}, correctAnswer=#{correctAnswer}"
				return lastP
			end	
	  end
		return newLastP
	end

	
end
