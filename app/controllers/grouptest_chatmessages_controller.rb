class GrouptestChatmessagesController < ApplicationController

 before_filter(:only => [:destroy] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }


	layout :green_web


  # DELETE /alu_groups/1
  # DELETE /alu_groups/1.xml
  def destroy
		g =  GrouptestChatmessage.find(params[:id])
		g.destroy
    redirect_to( g.test ) 
  end


	def changeComment
		@g =  GrouptestChatmessage.find(params[:grouptest_chatmessage_id])
	end

	def update  #TODO how can I change the name of the method?? to updateComment
		ActiveRecord::Base.logger.warn("params:")
		ActiveRecord::Base.logger.warn(params)
		@g = GrouptestChatmessage.find(params[:grouptest_chatmessage][:id])
		@g.comment = params[:grouptest_chatmessage][:comment]
		@g.save
		render :action => 'link'	
	end	


end
