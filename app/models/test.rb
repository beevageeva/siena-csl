class Test < ActiveRecord::Base

	
 belongs_to :work
	#DEPRECATED
 #has_many :answers ,{:order => "created_at"}, :dependent => :delete_all	
 has_many :answers,  -> { order(:created_at) },  :dependent => :delete_all	 
 has_many :grouptest_students , :dependent => :delete_all	
 has_many :registered_students , :through => :grouptest_students, :source => :student
 has_many :viewed_test_questions , :dependent => :delete_all

	has_many :test_alu_msgqualifs , :dependent => :delete_all	

 #chat messages
	#has_many :chat_messages	
	has_many :grouptest_chatmessages	


	def correctAnswers
		n = 0
		answers.each do |a|
			n+=1 if a.correctAnswer?
		end
		return n
	end



end
