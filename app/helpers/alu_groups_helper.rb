module AluGroupsHelper

def getStudentGrade(student_id, course_id, grade)
	gf = TestAluMsgqualif.includes(test: {work: :node}).where({student_id: student_id, nodes: {course_id: course_id}}).average(grade)
	return gf.nil? ? 0 : gf 
end
end
