module AluGroupsHelper

def getStudentGrade(student_id, course_id)
	gf = TestAluMsgqualif.includes(test: {work: :node}).where({student_id: student_id, nodes: {course_id: course_id}}).average(:grade_total)
	return gf.nil? ? 0 : (gf * 10.0 / 3.0)
end
end
