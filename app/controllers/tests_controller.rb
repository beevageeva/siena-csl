require 'works_helper'
require 'chat_messages_helper'


class TestsController < ApplicationController


#CHATTESTIMAGESDIR="#{Rails.root.to_s}/public/chatImages/test"

before_filter(:only => [:destroy ] ) { |c| c.auth  [ {:types => [User::PROF, User::ADMIN]} ]  }
before_filter(:only => [:listByWork] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN] } , {:types =>  [User::ALU] , :condition => lambda{|params,session| WorksHelper.studentCanViewWork(params[:work_id] , session[:useraccount_id])   } }]  }
before_filter(:only => [:show] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN] } , {:types =>  [User::ALU] , :condition => lambda{|params,session| WorksHelper.studentCanViewWork(Test.find(params[:id]).work_id, session[:useraccount_id])   }} ]  }



	layout :green_web


  def listByWork
    @tests = Test.find(:all , {:conditions => {:work_id => params[:work_id]} , :order => "created_at DESC"  });

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tests }
    end
  end


  # GET /tests/1
  # GET /tests/1.xml
  def show
    @test = Test.find(params[:id])
		if @test.work.assignedto_type == "AluGroup"
			@chatmessages = ChatMessage.joins(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => @test.id}).includes(:grouptest_chatmessages)
			alugroup = @test.work.assignedto
			#!!!  no msgtable anymore app/views/chat_messages/_msgtable.html.erb not used !!!
			#@msgtable = ChatMessagesHelper.getChatMessagesTable(alugroup, Proc.new{|username1, username2| {:test_id => @test.id, :from => username1, :to => username2}  })
			#check image graph !!! not used anymore, only 1 window for all group members
			#if !File.exists?("#{CHATTESTIMAGESDIR}/#{@test.id}.png") 
			#	ChatMessagesHelper.generatePngChat(@msgtable,"#{CHATTESTIMAGESDIR}/#{@test.id}")		
			#end
			@msgtable = ChatMessagesHelper.getChatMessagesList(alugroup, @test.id)
		  #ActiveRecord::Base.logger.warn "MSGLISTin show"
	    #ActiveRecord::Base.logger.warn @msgtable

		end
  end


#  def deleteTestImage
#		`rm -f #{CHATTESTIMAGESDIR}/#{params[:test_id]}.*`
#		redirect_to :action => 'show' , :id => params[:test_id] 
#  end
	




	#TODO validation
	def register_to_test
		test = Test.find(params[:test_id])
		return if !test ||  test.work.assignedto_type == Work::ASSIGNEDTOSTUDENT
		
		student_id = session[:useraccount_id]
		GrouptestStudent.create({:test_id => params[:test_id] , :student_id => student_id }) if !GrouptestStudent.find_by_test_id_and_student_id(params[:test_id],student_id)
		redirect_to :controller => "questions" , :action => "test" , :test_id => params[:test_id]	
		
	end	

	def leave_test
		gt = GrouptestStudent.find_by_test_id_and_student_id(params[:test_id] ,session[:useraccount_id])
		gt.destroy if gt
		redirect_to :controller => "works" , :action => "listByAssignedtoAndCourse" , :course_id => gt.test.work.node.course_id , :assignedto_id => gt.test.work.assignedto_id, :assignedto_type => gt.test.work.assignedto_type
	end	


  # DELETE /tests/1
  # DELETE /tests/1.xml
  def destroy
    @test = Test.find(params[:id])
    @test.destroy
		redirect_to :action => "listByWork" , :work_id => @test.work_id
  end



private



end
