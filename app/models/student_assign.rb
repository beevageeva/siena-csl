class StudentAssign < ActiveRecord::Base
attr_accessible :student_id, :course_id
	belongs_to :student
	belongs_to :course


end
