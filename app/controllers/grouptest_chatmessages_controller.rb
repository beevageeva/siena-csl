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
end
