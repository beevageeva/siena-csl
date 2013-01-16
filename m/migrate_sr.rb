#!/usr/bin/ruby

require 'rubygems'
require 'yaml'
require 'dbi'
require 'md5'
gem 'postgres'


		dndv = DBI.connect("DBI:Pg:nodes_dv", "graph", "grap56M")
		drrg = DBI.connect("DBI:Pg:rrg", "graph", "grap56M")
		

	drrg.do("delete from users ")
	#userinfo
	sth = dndv.prepare("select userid, username , lastname,firstname , email from userinfo; ")
	drrg.do("delete from students ")
	sth.execute
	i = 1
	while row = sth.fetch do 
		drrg.do("insert into students(id , created_at , updated_at) values (#{row[0]}  , NOW() , NOW()); ")
		salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
		#password is usernameA4x
		pw = "#{row[1]}A4x"
   	password_salt, password_hash =    salt, Digest::MD5.hexdigest(pw + salt)
		drrg.do("insert into users(id , username ,password_salt,password_hash , email, name , active , useraccount_id , useraccount_type,  created_at , updated_at) values (#{i} ,'#{row[1]}' , '#{password_salt}' , '#{password_hash}' , '#{row[4]}' , '#{row[2]}' , true, #{row[0]} , 'Student', NOW() , NOW()); ")
		i+=1
	end		


	#manager
	drrg.do("delete from teachers ")
	sth = dndv.prepare("select id, username , lastname,firstname , email from manager; ")
	sth.execute
	while row = sth.fetch do 
		drrg.do("insert into teachers(id , created_at , updated_at) values (#{row[0]}  , NOW() , NOW()); ")
		salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
		#password is usernameA4x
		pw = "#{row[1]}A4x"
   	password_salt, password_hash =    salt, Digest::MD5.hexdigest(pw + salt)
		drrg.do("insert into users(id , username ,password_salt,password_hash , email, name , active , useraccount_id , useraccount_type,  created_at , updated_at) values (#{i} ,'#{row[1]}' , '#{password_salt}' , '#{password_hash}' , '#{row[4]}' , '#{row[2]}' , true, #{row[0]} , 'Teacher', NOW() , NOW()); ")
		i+=1
	end	
	sth.finish	
	#1ADMIN	 user admin , pass admin2q
	drrg.do("delete from admins ")
	salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
  password_salt, password_hash =    salt, Digest::MD5.hexdigest("admin2q" + salt)
	drrg.do("insert into admins(id , created_at , updated_at) values (1  , NOW() , NOW()); ")
	drrg.do("insert into users(id , username ,password_salt,password_hash , email, name , active , useraccount_id , useraccount_type,  created_at , updated_at) values (#{i} ,'admin' , '#{password_salt}' , '#{password_hash}' , 'admin@hhh.cxz' , 'admin' , true, 1 , 'Admin', NOW() , NOW()); ")
 #1  asignatura por defecto no hay id 1
	drrg.do("delete from courses ")
  drrg.do("insert into courses(id , name ,created_at , updated_at) values (1  , 'Primera',  NOW() , NOW()); ")


	#asignatursa
	sth = dndv.prepare("select id, name from conceptmap;")
	sth.execute
	while row = sth.fetch do 
		drrg.do("insert into courses (id , name ,  created_at, updated_at) values (#{row[0]} ,'#{row[1]}' , NOW() , NOW()); ")
	end
	sth.finish	


	#questions
	drrg.do("delete from questions ")
	dndv.do("delete  from question q1 where (select count (id) from question  q2 where q2.id = q1.id ) > 1  ;")
	sth = dndv.prepare("select id, content, imagefilename , correctanswer, difficulty , answertime , luck, creatorid from question;")
	sth.execute
	begin
	while row = sth.fetch do 
		sth2 = drrg.prepare("select id from users where useraccount_type = 'Teacher' and useraccount_id = #{row[7]};")
		sth2.execute
		a = sth2.fetch
		if a
			uid = a[0] 
			sth2.finish
			sth2 = dndv.prepare("select c.id   from conceptmap c, node n, nodequestionrelation r where c.id = n.conceptmapid and r.nodeid = n.id and r.questionid = 11632 LIMIT 1;")
			sth2.execute
			a = sth2.fetch
			if a 
	    	courseid = a[0].to_i
				courseid = 1 if courseid == 0
			else	
	    	courseid = 1
			end
	    sth2.finish

			#postgres .columns with uppercase must be double quoted!!!
			drrg.do("insert into questions (id , content ,  \"answerTime\" , \"correctAnswer\" , difficulty , luck , img, course_id , user_id, created_at, updated_at) values (#{row[0]} ,'#{row[1].gsub("\$##" , "").gsub("##\$", "")}'  ,#{row[5]} , #{row[3]}  ,  #{row[4]}  , #{row[6]}  , '#{row[2]}' , #{courseid},  #{uid}, NOW() , NOW()); ")
		end
	end	
	rescue Exception
		puts "error inserting question with id =  #{row[0]}"
		raise
	end
	sth.finish	

	#respvar -> question_responses
	drrg.do("delete from question_responses ")
	sth = dndv.prepare("select id , response, questionid  from respvar;")
	sth.execute
	while row = sth.fetch do 
		drrg.do("insert into question_responses (id , response , question_id , created_at, updated_at) values (  #{row[0]} , '#{row[1].gsub("\$##" , "").gsub("##\$", "") }'  ,#{row[2]} ,NOW() , NOW()); ")
	end	
	sth.finish	



	#nodes
	drrg.do("delete from nodes ")
	sth = dndv.prepare("select node.id, content, minpasspoints, conceptmapid, creatorid from node  inner join conceptmap on conceptmap.id = node.conceptmapid;")
	sth.execute
	while row = sth.fetch do 
		sth2 = drrg.prepare("select id from users where useraccount_type = 'Teacher' and useraccount_id = #{row[4]};")
		sth2.execute
		a = sth2.fetch
		if a
			uid = a[0]
			drrg.do("insert into nodes (id , content, \"minPassPoints\" , course_id , user_id, created_at, updated_at) values (#{row[0]} ,'#{row[1]}'  ,#{row[2]} , #{row[3]}  ,   #{uid}, NOW() , NOW()); ")
		end
		sth2.finish
	end	
	sth.finish	

	#edges
	drrg.do("delete from edges ")
	i = 1
	sth = dndv.prepare("select srcnodeid, destnodeid, value from edge inner join label on label.id = edge.labelid;")
	sth.execute
	while row = sth.fetch do 
		drrg.do("insert into edges (id , src_id , dest_id , dep, created_at, updated_at) values ( #{i} ,  #{row[0]} ,#{row[1]}  ,#{row[2]} , NOW() , NOW()); ")
		i+=1
	end	
	sth.finish	

	#nodequestionrelation
	drrg.do("delete from node_question_relations ")
	sth = dndv.prepare("select id, nodeid, questionid, qua from nodequestionrelation;")
	sth.execute
	while row = sth.fetch do 
		drrg.do("insert into node_question_relations (id , node_id , question_id , dep, created_at, updated_at) values (  #{row[0]} ,#{row[1]}  ,#{row[2]}, #{row[3]} , NOW() , NOW()); ")
	end	
	sth.finish	
	

	#testgroup and work
	drrg.do("delete from works ")
	sth = dndv.prepare("select testgroup.id ,  work.type , testuserid, nodeid, qua  from testgroup , work where  testgroup.workid  = work.id;")
	sth.execute
	while row = sth.fetch do 
		drrg.do("insert into works (id , type , student_id , node_id , created_at, updated_at) values (  #{row[0]} ,#{row[1]}  ,#{row[2]}, #{row[3]} , NOW() , NOW()); ")
	end	
	sth.finish	

	#tests
	drrg.do("delete from tests ")
	sth = dndv.prepare("select id , finished, points , testgroupid  from test;")
	sth.execute
	while row = sth.fetch do 
		drrg.do("insert into tests (id , finished , points , work_id , created_at, updated_at) values (  #{row[0]} ,#{row[1]}  ,#{row[2]}, #{row[3]} ,NOW() , NOW()); ")
	end	
	sth.finish	

	#questionresponse  -> answers
	drrg.do("delete from answers ")
	sth = dndv.prepare("select questionresponse.id , response, responsetime , timeleft, questionid, testid, pointsstringarray   from questionresponse, testquestionresponse, test where questionresponse.id = testquestionresponse.questionresponseid and testid = test.id order by testid;")
	sth.execute
	oldtestid = -1
	while row = sth.fetch do 
		i= -1 if row[5]!=oldtestid
		i+=1
		pbef = row[6].split(";")[i]
		drrg.do("insert into answers (id , number , responsetime , timeleft ,  question_id , test_id, \"pointsBefore\", created_at, updated_at) values (  #{row[0]} ,#{row[1]}  , '#{row[2]}'  ,#{row[3]} ,#{row[4]} ,#{row[5]}  , #{pbef} ,NOW() , NOW()); ")
	end	
	sth.finish	

	#relatedcontent  
	drrg.do("delete from related_contents ")
	sth = dndv.prepare("select relatedcontent.id , filename , relatedcontentinfo.nodeid, recover, description  from relatedcontent, relatedcontentinfo where relatedcontent.relatedcontentinfoid = relatedcontentinfo.id;")
	sth.execute
	oldtestid = -1
	while row = sth.fetch do 
		i= -1 if row[5]!=oldtestid
		i+=1
		drrg.do("insert into related_contents (id ,filename, node_id, recover, description  , created_at, updated_at) values (  #{row[0]} , '#{row[1]}'  ,#{row[2]} ,#{row[3]} , '#{row[4]}'  ,NOW() , NOW()); ")
	end	
	sth.finish	
	
#sequences
	
		["edges" , "users" , "node_question_relations", "teachers", "students", "answers", "question_responses" , "related_contents" , "tests" , "works" , "nodes", "questions" , "courses" , "admins"].each do |t|
			drrg.do("select setval('#{t}_id_seq' , (select max(id) from #{t})  );")
		end

		dndv.disconnect
		drrg.disconnect
