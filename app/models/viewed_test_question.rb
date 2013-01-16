class ViewedTestQuestion < ActiveRecord::Base
	belongs_to :student
	belongs_to :test
	belongs_to :question

end
