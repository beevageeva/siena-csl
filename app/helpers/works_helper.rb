module WorksHelper


	def self.studentCanViewWork(work_id, student_id)
		w = Work.find(work_id)
		if w.assignedto_type == Work::ASSIGNEDTOSTUDENT
			return student_id == w.assignedto_id
		end		
		if w.assignedto_type == Work::ASSIGNEDTOALUGROUP
			#Now the students can see other groups tests
			#return w.assignedto.students.pluck("students.id").include?(student_id)
			return true
		end	
		return false
	end




def canTest(node, assignedto_id, assignedto_type)
	return false if User.find(session[:userid]).useraccount_type != User::ALU
	node.edges_as_source and node.edges_as_source.each do |e|
		pr = Node.find(e.dest_id)
		b = false
		getWork(e.dest_id , assignedto_id, assignedto_type).tests.each do |t|
					break if b
					if t.points
					 b = true if t.points > pr.minPassPoints
					else
						#TODO
						ActiveRecord::Base.logger.warn "***************** Test points null #{t.id}"
					end


		end	
			return false if !b
	end
	return true
end

def testsPassed?(node_id, assignedto_id, assignedto_type)
		n = Node.find(node_id)
		getWork(node_id , assignedto_id, assignedto_type ).tests.find_all do |t| 
					if t.points
				 		return true if t.points > n.minPassPoints  
					end
			end	
		return false
end


def recuperation?(node_id, assignedto_id, assignedto_type)
		return false if User.find(session[:userid]).useraccount_type != User::ALU
		tests = getWork(node_id , assignedto_id , assignedto_type).tests
		testsPassed = tests.find_all do |t|
				n = Node.find(node_id)
				if t.points
			 		t.points > n.minPassPoints  
				else
					#TODO
					ActiveRecord::Base.logger.warn "******************** Test points null #{t.id}"
					false
				end
		end	
		return tests && (tests.size > 0) &&  (! testsPassed || (testsPassed.size == 0))
end


	def getNodesRecursive(assignedto_type, assignedto_id, orig_node_id , reslist)
			getNodesRecursiveList(assignedto_type, assignedto_id , orig_node_id , Node.find(orig_node_id).successors , reslist)
	end



	def getNodesRecursiveList(assignedto_type,assignedto_id, orig_node_id ,succlist, reslist)
		succlist.each do |pr|
			#can change initial points if there is no test made
			w = Work.where(:node_id => pr.id , :assignedto_type => assignedto_type , :assignedto_id => assignedto_id).first
			if (not w or w.tests.length == 0) and pr.id != orig_node_id and not reslist.include?(pr)
				reslist.push(pr)
				getNodesRecursiveList(assignedto_type,assignedto_id, orig_node_id, pr.successors, reslist) if pr.successors and not pr.successors.empty?
			end

		end
	end

	def	getWork(node_id, assignedto_id, assignedto_type)
		 #Work.find_or_create_by_student_id_and_node_id(student_id , node_id, :initialpoints => Work::DEFAULT_INITIAL_POINTS) { |w| w.worktype = Work::TEST_TYPE }
		 w = Work.find_by_assignedto_id_and_assignedto_type_and_node_id(assignedto_id, assignedto_type , node_id)
		 if w.nil?
						#TODO uncomment
						#Notifier.no_work_assigned(node_id, student_id).deliver
						w = Work.create(:assignedto_id => assignedto_id ,:assignedto_type => assignedto_type ,  :node_id => node_id, :initialpoints => Work::DEFAULT_INITIAL_POINTS , :worktype => Work::TEST_TYPE)
						ActiveRecord::Base.logger.warn "********No work assigned******** nodeid = #{node_id} , :assignedto_id = #{assignedto_id} ,:assignedto_type = #{assignedto_type}  "
			end
			return w
	end
	
	
	def createWork(assignedto_type, assignedto_id, nodeid, initialpoints, worktype)
			w = Work.where(:assignedto_type => assignedto_type, :assignedto_id => assignedto_id, :node_id => nodeid).first
			#if work already assigned and made tests
			if w and w.tests.length > 0
	        return 0
			end
			if not w
				w = Work.new(:node_id => nodeid , :initialpoints => initialpoints, :assignedto_type => assignedto_type, :assignedto_id => assignedto_id, :worktype => worktype)
			else
				w.initialpoints = initialpoints
				w.worktype = worktype
			end
			return w.save
	end
	

#	def  getTestIdForWork(workId)
#			testold = nil
#			Test.where("finished = false and work_id = ? ", workId).all.each do |t|
#				break if testold
#				if  t.answers.size == 0
#					testold = t
#				end
#			end
#			if ! testold
#					testold = Test.create(:work_id => workId, :finished => false)
#			end
#			#TODO duplicate code in TestsController#new
#			work = testold.work
#      if work.initialpoints.nil?
#        testold.points = Work::DEFAULT_INIT_POINTS
#      else
#        testold.points = work.initialpoints
#      end
#			testold.save
#			test_id = testold.id
#			return test_id
#	end




end


