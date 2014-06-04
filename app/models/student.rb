class Student < ActiveRecord::Base


 has_one :user, :as => :useraccount
 has_many :student_assigns , :dependent => :delete_all
 has_many :courses, :through => :student_assigns

 has_many :works , :as => :assignedto, :dependent => :delete_all
 has_many :answers 
 has_many :nodes, :through => :works

	#chats
	has_many :messages_as_source , :foreign_key => :from
	has_many :messages_as_dest , :foreign_key => :to
#join model many to many
has_many	:student_alu_groups, :dependent => :delete_all
has_many	:alu_groups, :through => :student_alu_groups

has_many	:grouptest_students, :dependent => :delete_all
has_many	:registered_tests , :through => :grouptest_students, :source => :test
end
