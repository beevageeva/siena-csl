require 'file_helper'

class Question < ActiveRecord::Base

attr_accessible :content, :answerTime, :correctAnswer, :difficulty, :luck, :imgFile, :course_id,  :keywords, :img

	has_many :node_question_relations , :dependent => :delete_all
	has_many :nodes, :through => :node_question_relations
	has_many :question_responses, :dependent => :delete_all , :order => "id"
	has_many :answers, :dependent => :delete_all


	belongs_to :course
	belongs_to :teacher

#  validates_uniqueness_of :content
	validates_numericality_of :answerTime, :only_integer => true, :message => "tiene que ser entero."
	validates_inclusion_of :answerTime, :in => 10..5000, :message => "solo puede ser entre 10 y 5000." 
	validates_numericality_of :correctAnswer, :only_integer => true, :message => "tiene que ser entero."
	validates_numericality_of :difficulty, :only_integer => false, :message => "tiene que ser  float."
	validates_inclusion_of :difficulty, :in => 0..1, :message => "solo puede ser entre 0 y 1." 
	validates_numericality_of :luck, :only_integer => false, :message => "tiene que ser  float."
	validates_inclusion_of :luck, :in => 0..1, :message => "solo puede ser entre 0 y 1." 


	QUESTIONS_FILES_DIR	=  "#{Rails.root.to_s}/public/questions"

	


  def imgFile=(file)
    FileHelper::uploadFileCheckSize(file, QUESTIONS_FILES_DIR, self, "img")
  end

  def deleteImgFile
      FileHelper::deleteFile(QUESTIONS_FILES_DIR, self.img) 
			self.img = ""
			save
  end



end
