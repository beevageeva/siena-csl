class Work < ActiveRecord::Base

	attr_accessible  :node_id, :initialpoints, :worktype, :assignedto_type, :assignedto_id 


	belongs_to :assignedto, :polymorphic => true
	belongs_to :node

	has_many :tests , :dependent => :destroy

 	VIEW_CONTENTS_TYPE = 0;
  TEST_TYPE = 1;

	WORK_TYPES = [VIEW_CONTENTS_TYPE , TEST_TYPE]
	DEFAULT_INITIAL_POINTS = 0.2	


	#TODO 
	DEFAULT_INIT_POINTS = 0.2		

	ASSIGNEDTOALUGROUP = "AluGroup"
	ASSIGNEDTOSTUDENT = "Student"
	ASSIGNEDTOTYPES = ["AluGroup", "Student"]

end
