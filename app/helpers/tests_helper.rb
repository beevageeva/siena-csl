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
		Work.joins(:node).where(node_id: node_ids, assignedto_id: alu_group_ids, assignedto_type: Work::ASSIGNEDTOALUGROUP).each do |w|
			res = {node: w.node.content, tests: []}
			w.tests.where(finished: true).each do |t|
				res[:tests].push({points: "%1.3f" % t.points, answ: "#{t.answers.size - t.correctAnswers}/#{t.answers.size}"})
			end
			t2.push(res)
			
		end	
		return {students: t1, alu_groups: t2}

	end

end
