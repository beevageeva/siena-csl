class AluGroup < ActiveRecord::Base

	has_many   :competences , :through => :competence_groups
	has_many  	:competence_groups , :dependent => :delete_all

	has_many	:students,		:through => :student_alu_groups
	has_many	:student_alu_groups, :dependent => :delete_all

	has_many :works , :as => :assignedto, :dependent => :delete_all

	belongs_to :course


	validates_uniqueness_of :name  , :scope => [:course_id]
	validates_format_of :name, :with => /\A([a-z0-9-_ ]+)\Z/i


	NUMBER_SECONDS_ONLINE_STUDENT = 6
	


	def onlinestudents
		students = Student.arel_table
		student_alu_groups = StudentAluGroup.arel_table
		onlinecondition = students[:lastcheck].gt(Time.at(Time.now.to_i - NUMBER_SECONDS_ONLINE_STUDENT))
		alugroup_condition = StudentAluGroup.where(student_alu_groups[:student_id].eq(students[:id]).and(student_alu_groups[:alu_group_id].eq(id))).exists
		Student.where(onlinecondition.and(alugroup_condition))
	end	

	def online_testing_students(test_id)
		return online_testingcond_students(test_id,true)
	end
	def online_nottesting_students(test_id)
		return online_testingcond_students(test_id,false)
	end

private	
	def online_testingcond_students(test_id, testing)
		grouptest_students = GrouptestStudent.arel_table
		students = Student.arel_table
		onlinecondition = students[:lastcheck].gt(Time.at(Time.now.to_i - NUMBER_SECONDS_ONLINE_STUDENT))
		condition = GrouptestStudent.where(grouptest_students[:test_id].eq(test_id).and(grouptest_students[:student_id].eq(students[:id]))).exists	
		if !testing
			student_alu_groups = StudentAluGroup.arel_table
			condition_in_alu_group = StudentAluGroup.where(student_alu_groups[:student_id].eq(students[:id]).and(student_alu_groups[:alu_group_id].eq(self.id) )).exists
			condition = condition.not.and(condition_in_alu_group)	
		end
		arelquery = Student.where(onlinecondition.and(condition))
		ActiveRecord::Base.logger.warn("testing user #{test_id} , #{testing}")		
		ActiveRecord::Base.logger.warn(arelquery)
		return arelquery		
	
	end


end
