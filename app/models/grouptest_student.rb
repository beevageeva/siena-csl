class GrouptestStudent < ActiveRecord::Base


	attr_accessible :test_id, :student_id
	

	belongs_to :test
	belongs_to :student

end
