class Edge < ActiveRecord::Base

	def self.primary_key
    'id'
  end


	belongs_to :src , :class_name => "Node"
	belongs_to :dest , :class_name => "Node"

	
	validates_numericality_of :dep, :only_integer => false, :message => "tiene que ser  float."
	validates_inclusion_of :dep, :in => 0..1, :message => "solo puede ser entre 0 y 1." 

end
