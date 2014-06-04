class Node < ActiveRecord::Base


	#changed because has_many_and_belongs_to deprecated edges deleted here, no need for before_destroy
	has_many :successors , :through => :edges_as_source, :source => :dest
	has_many :predecessors , :through => :edges_as_dest, :source => :src
	has_many :edges_as_source ,:foreign_key => 'src_id', :class_name => 'Edge',  :dependent => :delete_all	
	has_many :edges_as_dest ,:foreign_key => 'dest_id', :class_name => 'Edge', :dependent => :delete_all	
	def edges
		edges_as_source + edges_as_dest
	end

	has_many :node_question_relations , :dependent => :delete_all
	has_many :questions, :through => :node_question_relations
	has_many :competences, :through => :competence_nodes
	has_many :competence_nodes , :dependent => :delete_all	
	has_many :works , :dependent => :delete_all	

	belongs_to :course
	belongs_to :teacher

	has_many :related_contents , :dependent => :delete_all	


	validates_numericality_of :minPassPoints, :only_integer => false, :message => "tiene que ser  float."
	validates_inclusion_of :minPassPoints, :in => 0..1, :message => "solo puede ser entre 0 y 1." 
	#should validate uniqueness of content and course
  validates_uniqueness_of :content  , :scope => [:course_id]




end
