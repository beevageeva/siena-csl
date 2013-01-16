#!/usr/bin/ruby

require 'jcode'
require 'rubygems'
require 'yaml'
require 'dbi'
require 'md5'
gem 'postgres'

COURSEID=21504
RCPATH="/local/ruby/rrg/trunk/public/relatedContents/" 


drrg = DBI.connect("DBI:Pg:rrg", "graph", "grap56M")
sth = drrg.prepare("select id from nodes where course_id = #{COURSEID};");
sth.execute
while row = sth.fetch do
	nodeid = row[0]
	sth2 = drrg.prepare("select id from related_contents where node_id = #{nodeid};")
	sth2.execute
	while row2 = sth2.fetch do
		rcid = row2[0]
		longfn =  Dir["#{RCPATH}#{rcid}/*"][0]
		if longfn.nil?
			puts "no rc for #{rcid}"
		else
			fn = longfn.gsub("#{RCPATH}#{rcid}/","")
			newfn = fn.tr("áéíóúñÁÉÍÓÚÑ","aeiounAEIOUN").tr("^a-zA-Z0-9_.","_")	
			puts("rename #{RCPATH}#{rcid}/#{fn}  to #{RCPATH}#{rcid}/#{newfn}")
			File.rename("#{RCPATH}#{rcid}/#{fn}" , "#{RCPATH}#{rcid}/#{newfn}")
			puts "update related_contents set filename = '#{newfn}'  where id = #{rcid};  "
			drrg.do("update related_contents set filename = '#{fn}'  where id = #{rcid};  ")
		end
	end	
	sth2.finish
end
sth.finish	
		
drrg.disconnect
