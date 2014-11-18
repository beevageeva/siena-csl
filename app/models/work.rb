class Work < ActiveRecord::Base


	belongs_to :assignedto, :polymorphic => true
	belongs_to :node

	has_many :tests , -> {order "created_at DESC"} , :dependent => :destroy

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
