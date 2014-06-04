class StudentAluGroup < ActiveRecord::Base

	belongs_to :student
	belongs_to :alu_group
end
