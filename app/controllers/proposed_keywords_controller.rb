class ProposedKeywordsController < ApplicationController
 before_filter(:only => [ :show, :reject, :accept] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }

layout :green_web



  def show
		ActiveRecord::Base.logger.warn "**SHOW KEYWORD AJAX**** question_id=#{params[:question_id]},  keyword = #{params[:keyword]}"
		#@chat_messages = ChatMessageKeywords.where({:keyword => params[:keyword], :question_id => params[:question_id] })

		@chat_messages = ChatMessageKeywords.find_by_sql(["select distinct cm1.previous  as c1, cm1.keyword as c2, cm2.keyword as c3 from chat_message_keywords cm1 INNER JOIN chat_message_keywords cm2 ON cm1.keyword = cm2.previous WHERE cm1.chat_message_id = cm2.chat_message_id AND (cm2.keyword = :keyword OR cm2.previous = :keyword OR cm1.previous = :keyword ) and cm1.question_id = :question_id and cm1.previous is not null", {:question_id => params[:question_id], :keyword => params[:keyword] }])

		@chat_messages2 = ChatMessageKeywords.find_by_sql(["select distinct cm.previous  as c1, cm.keyword as c2  from chat_message_keywords cm WHERE (cm.keyword = :keyword OR cm.previous = :keyword ) and cm.question_id = :question_id and cm.previous is not null", {:question_id => params[:question_id], :keyword => params[:keyword] }])
	
		@highlights = []
		indexFile = File.join(QuestionsController::FERRET_INDEX_DIR, params[:question_id])
		@chat_messages.each do |cm|
			@highlights = @highlights | SpellingCorrector.searchIndex([cm.c1,cm.c2,cm.c3], indexFile)
		end	
		@chat_messages2.each do |cm|
			@highlights = @highlights | SpellingCorrector.searchIndex([cm.c1,cm.c2], indexFile)
		end	
		@highlights = @highlights | SpellingCorrector.searchIndex(params[:keyword], indexFile)
		ActiveRecord::Base.logger.warn("-----------------HIGHLIGHTS SIZE  #{@highlights.size}")	
		render :action => 'show' , layout: false
  end


	def list
		question_id = params[:question_id].to_i
		res = ProposedKeywords.where("question_id = ?", question_id).order("state asc, count desc").to_json(:only => [ :keyword, :state, :count ])
		render :json => res
	end

  def reject
		keyword =  params[:keyword]
		question_id =  params[:question_id]
		if(!keyword.nil? && !question_id.nil?)
			ActiveRecord::Base.logger.warn "**REJECT KEYWORD AJAX**** question_id=#{question_id},  keyword = #{keyword}"	
			res = ProposedKeywords.where("question_id = ? and keyword in (?)", question_id, keyword ).limit(1)
			if(res && res.size>0)
				pk = res[0]
				pk.state = ProposedKeywords::REJECTED_STATE
				pk.save
			end
  	end
		render :json => {:error =>  false}
  end


  def accept
		keyword =  params[:keyword]
		question_id =  params[:question_id]
		if(!keyword.nil? && !question_id.nil?)
			ActiveRecord::Base.logger.warn "**ACCEPT KEYWORD AJAX**** question_id=#{question_id},  keyword = #{keyword}"	
			res = ProposedKeywords.where("question_id = ? and keyword in (?)", question_id, keyword ).limit(1)
			if(res && res.size>0)
				pk = res[0]
				pk.state = ProposedKeywords::ACCEPTED_STATE
				pk.save
			end
		end
		render :json => {:error =>  false}

	end

  def setnew
		keyword =  params[:keyword]
		question_id =  params[:question_id]
		if(!keyword.nil? && !question_id.nil?)
			ActiveRecord::Base.logger.warn "**ACCEPT KEYWORD AJAX**** question_id=#{question_id},  keyword = #{keyword}"	
			res = ProposedKeywords.where("question_id = ? and keyword in (?)", question_id, keyword ).limit(1)
			if(res && res.size>0)
				pk = res[0]
				pk.state = ProposedKeywords::NEW_STATE
				pk.save
			end
		end
		render :json => {:error =>  false}

	end

end
