class QuestionResponse < ActiveRecord::Base
attr_accessible :response, :question_id

	belongs_to :question

end
