module QuestionsHelper

	def adminQN(q)
		useraccountType = User.find(session[:userid]).useraccount_type
		return true if useraccountType == User::ADMIN	
		return true if  useraccountType == User::PROF && q.teacher.user.id == session[:userid]
		return false
	end


	
end
