module CoursesHelper
include ActiveSupport::Inflector

MAPIMAGES = "mapImages" unless const_defined?(:MAPIMAGES)
MAPIMAGESDIR = "#{Rails.root.to_s}/public/#{MAPIMAGES}" unless const_defined?(:MAPIMAGESDIR)


def generatePng(c)
	t = "digraph G {\n"
	c.nodes.each do |n|
		t << n.id.to_s
		t << "[label=\""
		i = 0
		a = n.content.gsub(/\s+/) do |space|
			i = i + 1	
			if i == 3
				i = 0
					 '\n'
			else
						 " "	
	 		end
		end
		t << a
		t << "\"]\n"
	end
	c.nodes.each do |n|
		n.edges_as_source.each do |s|
			t << n.id.to_s
			t << " -> "
			t << s.dest_id.to_s
			t << "\n"
		end
	end
	t<<"}\n"
	fn = "#{MAPIMAGESDIR}/#{c.id}"
  f = File.open(fn + ".dot" , 'w')
  f.write(t)
  f.close
	`dot -Tpng  #{fn}.dot -o #{fn}.png`
end


def importFromXML(file)
	doc = REXML::Document.new file.read()
	#msg = ""
	begin
		if Course.find_by_name(doc.root.elements["name"].text)
			course = Course.create(:name => (doc.root.elements["name"].text + Time.new.to_i.to_s)  ) 
			#msg << "course #{doc.root.elements["name"].text} exists \n"
		else
			course = Course.create(:name =>  doc.root.elements["name"].text)
			#msg << "course #{doc.root.elements["name"].text} created \n"
		end
		usermap = Hash.new
		studentmap = Hash.new
		teachermap = Hash.new
		nodemap = Hash.new
		alugroupmap = Hash.new
		#teachers
		doc.elements.each("course/teachers/teacher")  do |ta|
			u = ta.elements["user"] 
			user = User.find_by_username(u.elements["username"].text)
			if user.nil?
				user = User.new(:username => u.elements["username"].text , :email => u.elements["email"].text, :useraccount_type => User::PROF, :name => u.elements["name"].text)
				#these are not amss assigned: password_hash, useraccount_id, active, password_salt
				user.password_hash=u.elements["password-hash"].text
				user.password_salt=u.elements["password-salt"].text
				user.active = u.elements["active"].text
				teacher = Teacher.create
				user.useraccount_id =  teacher.id
				user.save
				#msg << "prof  #{user.username} created\n"
			elsif user.useraccount_type == User::PROF
				teacher = user.useraccount
				#msg << "teacher #{teacher.id} inserted in course\n"
			else
				ActiveRecord::Base.warn("!!!WARNING!!!want to insert teacher, but a user with username = #{u.elements["username"].text} with type #{user.useraccount_type} already exists")
			end	
			usermap[u.elements["id"].text] = user.id
			if teacher
				TeacherAssign.create(:teacher_id => teacher.id, :course_id => course.id )
				teachermap[ta.elements["id"].text] = teacher.id
			end
		end

		if teachermap.size > 0
			defaultteacherid = teachermap.first[1]
		else
			ActiveRecord::Base.warn("no teacher matr")
			defaultteacherid = nil
		end

		#students
		doc.elements.each("course/students/student")  do |sa|
			u = sa.elements["user"] 
			user = User.find_by_username(u.elements["username"].text)

			if user.nil?
				user = User.new(:username => u.elements["username"].text , :email => u.elements["email"].text, :useraccount_type => User::ALU, :name => u.elements["name"].text)
				#these are not amss assigned: password_hash, useraccount_id, active, password_salt
				user.password_hash=u.elements["password-hash"].text
				user.password_salt=u.elements["password-salt"].text
				user.active = u.elements["active"].text
				student = Student.create
				user.useraccount_id =  student.id
				user.save
				#msg << "prof  #{user.username} created\n"
			elsif user.useraccount_type == User::ALU
				student = user.useraccount
				#msg << "student #{student.id} inserted in course\n"
			else
				ActiveRecord::Base.warn("!!!WARNING!!!want to insert student, but a user with username = #{u.elements["username"].text} with type #{user.useraccount_type} already exists")
			end	
			usermap[u.elements["id"].text] = user.id
			if student
				StudentAssign.create(:student_id => student.id, :course_id => course.id )
				studentmap[sa.elements["id"].text] = student.id
			end
		end
		if studentmap.size > 0
			defaultstudentid = studentmap.first[1]
		else
			ActiveRecord::Base.warn("no student matr")
			defaultstudentid = nil
		end



		#alu_groups
		doc.elements.each("course/alu_groups/alu-group")  do |sa|
				alu_group = AluGroup.create(:name => sa.elements["name"].text, :course_id => course.id)
				alugroupmap[sa.elements["id"].text] = alu_group.id
				tlist = sa.elements.each("students/student") do |t|
					sid = t.elements["id"].text.to_i 
					if (sid_from_map = studentmap[sid])
						StudentAluGroup.create_by_student_id_and_alu_group_id(sid_from_map, alu_group.id)
					end
	
				end
		end	
		#nodes and works
		doc.elements.each("course/nodes/node")  do |ne|
			content = ne.elements["content"].text
			if !(teacher_id = teachermap[ne.elements["teacher-id"].text])
				teacher_id = defaultteacherid
				ActiveRecord::Base.warn("add node teacher not  matr using default")
			end
			if teacher_id	
				#msg << "create node: teacher_id #{ne.elements["teacher_id"].text} not in map set to null\n"
				node = Node.new(:content => content, :course_id => course.id, :minPassPoints => ne.elements["minPassPoints"].text )
				node.teacher_id = teacher_id
				node.save
			end
				#msg << "node #{content} created\n"
			if node
				nodemap[ne.elements["id"].text] = node.id
				#works
				ne.elements["works"].elements.each("work") do |we|
					assignedto_type = we.elements["assignedto-type"].text
					if assignedto_type == 'Student'
					#assigned to student
						assignedto_id = studentmap[we.elements["assignedto-id"].text]
						assignedto_id = defaultstudentid if assignedto_id.nil?
					else
						#assigned to alu_group
						assignedto_id = alugroupmap[we.elements["assignedto-id"].text]
					end
	
					if assignedto_id.nil?
						#msg << "student_id #{we.elements['student_id'].text} not in map(desmatr) work will not be inserted\n"
					else
						Work.create(:node_id => node.id ,:assignedto_type => assignedto_type, :assignedto_id => assignedto_id , :initialpoints => we.elements["initialpoints"].text, :worktype => we.elements["worktype"].text)
					end
				end
			end
			#end works
		end
		#questions and node_question_relations
		doc.elements.each("course/questions")  do |qes|
			qes.elements.each("question") do |qe|
				content = qe.elements["content"].text
				if !(teacher_id = teachermap[qe.elements["teacher-id"].text])
					teacher_id = defaultteacherid
					ActiveRecord::Base.warn("add question teacher not  matr using default")
				end
				if teacher_id	
					question = Question.new(:content => content, :course_id => course.id , :answerTime => qe.elements["answerTime"].text , :correctAnswer => qe.elements["correctAnswer"].text , :difficulty => qe.elements["difficulty"].text , :img => qe.elements["img"].text , :luck => qe.elements["luck"].text )
					question.teacher_id = teacher_id
					question.save
				else
					ActiveRecord::Base.logger.warn("!!!WARNING!!! teacher with #{qe.elements["teacher-id"].text} not matriculated in original course")
				end
					#msg << "question #{content} created\n"
				if question
					#nqr
					qe.elements["node-question-relations"].elements.each("node-question-relation") do |nqre|
						node_id = nodemap[nqre.elements["node-id"].text]
						if node_id.nil?
							#msg << "node_id #{nqre.elements['node_id'].text} not in map\n"
						else
							NodeQuestionRelation.create(:node_id => node_id , :question_id => question.id , :dep => nqre.elements["dep"].text)
							#msg << "NodeQuestionRelation for node_id #{node_id} and question_id #{question.id} -  created\n"
						end
					end
					#quest_resp
					qe.elements["question-responses"].elements.each("question-response") do |qre|
						qrtext = qre.elements["response"].text
						QuestionResponse.create(:response => qrtext , :question_id => question.id )
							#msg << "QuestionResponse #{qrtext} for question_id #{question.id} created\n"
							#msg << "QuestionResponse #{qrtext} question_id #{question.id} -  exists, not inserted\n"
					end
				end
			end
			return course.name
		end
	rescue Exception => e
		ActiveRecord::Base.logger.warn "Error import xml"
		ActiveRecord::Base.logger.warn e
		ActiveRecord::Base.logger.warn e.backtrace.join("\n")
		return false
	end
	#ActiveRecord::Base.logger.warn "*************************************IMPORTXML**************************************************"
	#ActiveRecord::Base.logger.warn #msg

end

end
