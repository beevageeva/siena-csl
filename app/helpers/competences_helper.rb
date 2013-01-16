module CompetencesHelper
	include WorksHelper

def competencePassed?(competence)
		competence.nodes.each do |n|
			return false if not testsPassed?(n.id)
		end
		return true
end
end
