class Test < ActiveRecord::Base

	attr_accessible  :work_id, :finished, :points 
	
 belongs_to :work
 has_many :answers , :order => "created_at", :dependent => :delete_all	
 has_many :grouptest_students , :dependent => :delete_all	
 has_many :registered_students , :through => :grouptest_students, :source => :student
 has_many :viewed_test_questions , :dependent => :delete_all	

 #chat messages
	has_many :chat_messages	

end
