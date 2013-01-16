class Competence < ActiveRecord::Base
attr_accessible :name, :description

	has_many	 :alu_groups , :through => :competence_groups
	has_many	 :competence_groups , :dependent => :delete_all
	has_many	 :nodes , :through => :competence_nodes
	has_many	 :competence_nodes, :dependent => :delete_all 
end
