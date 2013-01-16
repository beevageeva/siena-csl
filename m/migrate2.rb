#!/usr/bin/ruby

require 'rubygems'
require 'yaml'
require 'dbi'
require 'md5'
gem 'postgres'


	drrg = DBI.connect("DBI:Pg:rrg", "graph", "grap56M")
		

	drrg.do("delete from student_assigns ")
	#alumnos matriculados -- de tabla tests
	sth = drrg.prepare("select distinct student_id, course_id from tests , nodes, works  where tests.work_id = works.id and nodes.id = works.node_id; ")
	sth.execute
	while row = sth.fetch do 
		drrg.do("insert into student_assigns( student_id, course_id , created_at , updated_at) values (#{row[0]} ,  #{row[1]} , NOW() , NOW())  returning id; ")
	end		
	sth.finish	

		drrg.disconnect
