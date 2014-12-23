class ProposedKeywordsController < ApplicationController
 before_filter(:only => [ :show, :reject, :accept] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }

layout :green_web



  def show
		ActiveRecord::Base.logger.warn "**SHOW KEYWORD AJAX**** question_id=#{params[:question_id]},  keyword = #{params[:keyword]}"
		@chat_messages = ChatMessageKeywords.includes(:chat_message).where(:keyword => params[:keyword])
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
