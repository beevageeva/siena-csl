class Test < ActiveRecord::Base

	
 belongs_to :work
	#DEPRECATED
 #has_many :answers ,{:order => "created_at"}, :dependent => :delete_all	
 has_many :answers,  -> { order(:created_at) },  :dependent => :delete_all	 
 has_many :grouptest_students , :dependent => :delete_all	
 has_many :registered_students , :through => :grouptest_students, :source => :student
 has_many :viewed_test_questions , :dependent => :delete_all	

 #chat messages
	has_many :chat_messages	

end
