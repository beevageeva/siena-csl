module QuestionsHelper

	def adminQN(q)
		User.find(session[:userid]).useraccount_type == User::ADMIN || q.teacher.user.id == session[:userid]
	end

	
end
