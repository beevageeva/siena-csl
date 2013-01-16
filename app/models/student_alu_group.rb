class StudentAluGroup < ActiveRecord::Base
attr_accessible :alu_group_id, :student_id

	belongs_to :student
	belongs_to :alu_group
end
