class CompetenceNode < ActiveRecord::Base

	belongs_to	:competence
	belongs_to	:node
end
