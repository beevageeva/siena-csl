class TeacherAssign < ActiveRecord::Base
attr_accessible :teacher_id, :course_id

  belongs_to :teacher
  belongs_to :course


end
