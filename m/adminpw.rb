#!/usr/bin/ruby

require 'jcode'
require 'rubygems'
require 'yaml'
require 'dbi'
require 'md5'
gem 'postgres'


username = 'alu'
pw = ''
salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
pw_hash=Digest::MD5.hexdigest(pw + salt)


drrg = DBI.connect("DBI:Pg:rrg", "graph", "grap56M")
sth = drrg.prepare("update users set password_salt = '#{salt}', password_hash = '#{pw_hash}' where username = '#{username}';");
sth.execute
sth.finish	
drrg.disconnect
