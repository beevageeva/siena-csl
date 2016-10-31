module QuestionsHelperAlg

  ActiveRecord::Base.logger.warn "****************Loading module QuestionsHelperAlg**************#{SienaCsl::Application.config.OLDTEST}***************"
	if  SienaCsl::Application.config.OLDTEST
		require_relative 'questions_helper_alg_old.rb'
		include QuestionsHelperAlgOld
	else
		require_relative  'questions_helper_alg_new.rb'
		include QuestionsHelperAlgNew
	end

end


	
