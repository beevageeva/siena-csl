module QuestionsHelper

	def adminQN(q)
		useraccountType = User.find(session[:userid]).useraccount_type
		return true if useraccountType == User::ADMIN	
		return true if  useraccountType == User::PROF && q.teacher.user.id == session[:userid]
		return false
	end


	def getNumberOfCorrectAnswers(question_id, question_correctAnswer)
		return Answer.where({question_id: question_id, number: question_correctAnswer}).count
	end

	
end
