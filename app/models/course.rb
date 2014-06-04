class Course < ActiveRecord::Base
	
	has_many :student_assigns , :dependent => :delete_all
	has_many :teacher_assigns , :dependent => :delete_all
	
	has_many :students, :through => :student_assigns
	has_many :teachers, :through => :teacher_assigns

	#nodes and questions need destroy in order to delete edges (succ, pred) and relations
	has_many :questions , :dependent => :destroy
	has_many :nodes , :dependent => :destroy
	#destroy alu_groups
	has_many :alu_groups, :dependent => :destroy


  validates_uniqueness_of :name

end
