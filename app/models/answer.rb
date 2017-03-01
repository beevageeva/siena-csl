class Answer < ActiveRecord::Base

	belongs_to :test
	belongs_to :question
	belongs_to :student
	

#	def correctAnswer?
#		#number is a field of answer
#		return number == question.correctAnswer
#	end

end

