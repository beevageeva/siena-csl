class CompetenceNode < ActiveRecord::Base
attr_accessible :node_id, :competence_id

	belongs_to	:competence
	belongs_to	:node
end
