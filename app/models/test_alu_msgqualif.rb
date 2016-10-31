class TestAluMsgqualif < ActiveRecord::Base
  belongs_to :test
  belongs_to :student


	validates_numericality_of :grade1, :grade2 , :grade3, :grade4, :grade_total, :only_integer => false, :message => "tiene que ser entero." , :allow_nil => true
	validates_inclusion_of :grade1, :grade2 , :grade3, :grade4, :grade_total, :in => 0..1, :message => "solo puede ser entre 0 y 1." ,  :allow_nil => true
end
