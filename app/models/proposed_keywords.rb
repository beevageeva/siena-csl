class ProposedKeywords < ActiveRecord::Base
  belongs_to :question


	NEW_STATE = 0
	ACCEPTED_STATE = 1
	REJECTED_STATE = 2


end
