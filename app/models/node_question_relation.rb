class NodeQuestionRelation < ActiveRecord::Base
attr_accessible :node_id, :question_id, :dep

	belongs_to :node
	belongs_to :question

	validates_numericality_of :dep, :only_integer => false, :message => "tiene que ser  float."
	validates_inclusion_of :dep, :in => 0..1, :message => "solo puede ser entre 0 y 1." 
end
