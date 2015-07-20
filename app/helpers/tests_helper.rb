module TestsHelper

	def getStudentTests(s, course_id)
		c = Course.find(course_id)
		node_ids = c.nodes.pluck(:id)
		t1 = []
		Work.joins(:node).where(node_id: node_ids, assignedto_id: s.id, assignedto_type: Work::ASSIGNEDTOSTUDENT).each do |w|
			res = {node: w.node.content, tests: []}
			w.tests.where(finished: true).each do |t|
				res[:tests].push({points: "%1.3f" % t.points, answ: "#{t.answers.size - t.correctAnswers}/#{t.answers.size}"})
			end
			t1.push(res)
		end
		alu_group_ids = s.alu_groups.pluck(:id)
		t2 = []

		gradeFromTag = 0
		#TODO make a different select ? see below
		#test_ids = []
		Work.joins(:node).where(node_id: node_ids, assignedto_id: alu_group_ids, assignedto_type: Work::ASSIGNEDTOALUGROUP).each do |w|
			res = {node: w.node.content, tests: []}
			w.tests.where(finished: true).each do |t|
				testMap = {points: "%1.3f" % t.points, answ: "#{t.answers.size - t.correctAnswers}/#{t.answers.size}"}
				if (tag = TestAluMsgqualif.find_by_test_id_and_student_id(t.id, s.id))
					testMap[:tag] = tag
					gradeFromTag+=tag.grade_total
				end
				res[:tests].push(testMap)
				#test_ids.push(t.id)	
			end
			t2.push(res)
			
		end	
		#TestAluMsgqualif.where({test_id: test_ids, student_id: s.id})
		return {students: t1, alu_groups: t2, gradeFromTag: (gradeFromTag * 10.0) / (3.0 * t2.size)}

	end

end
