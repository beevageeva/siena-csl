class WorksController < ApplicationController

require 'works_helper'
require 'chat_messages_helper'

#not used anymore
#CHATWORKIMAGESDIR="#{Rails.root.to_s}/public/chatImages/work"

before_filter(:only => [:new, :create, :newAll, :createAll, :getNodesDep, :destroy, :edit, :update] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]   } ] }
before_filter(:only => [:show] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN] } , {:types =>  [User::ALU] , :condition => lambda{|params,session| WorksHelper.studentCanViewWork(params[:id] , session[:useraccount_id])   }} ]  }
#trabajos_asignatura/:assignedto_type/:assignedto_id/:course_id los alumnos solo pueden ver lista de trabajos de asignados a ellos o a un grupo a que aparten
#before_filter(:only => [:listByAssignedtoAndCourse, :listByAssignedtoAndCourseXML] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN, User::ALU]   } ] }
before_filter(:only => [:listByAssignedtoAndCourse, :listByAssignedtoAndCourseXML] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN] } , {:types =>  [User::ALU] , :condition => lambda{|params,session| WorksHelper.studentCanListWorks(params[:assignedto_id].to_i, params[:assignedto_type] , session[:useraccount_id] )   }} ]  }

	layout :green_web

	include WorksHelper



  def listByAssignedtoAndCourse
    @works = Work.where("assignedto_id  = ? and assignedto_type = ? and nodes.course_id = ?", params[:assignedto_id] , params[:assignedto_type] , params[:course_id]).includes(:node)
		if params[:assignedto_type] == 'Student'
			@name = Student.find(params[:assignedto_id]).user.name
		else
			alugroup = AluGroup.find(params[:assignedto_id])
			@name = alugroup.name
			#TODO delete the following
			#@alugroupid = alugroup.id
			#@alugroupusers = User.includes("alu_groups").where("username <> ? and alu_groups.id = ?",User.find(session[:userid]).username, params[:assignedto_id] )
		end	

  end


	def listByAssignedtoAndCourseXML
    @works = Work.where("assignedto_id  = ? and assignedto_type = ? and nodes.course_id = ?", params[:assignedto_id] , params[:assignedto_type] , params[:course_id]).includes(:node, :tests => {:answers => :question})
		render :xml => @works.to_xml(:include =>{:tests => {:include => {:answers => {:include => :question}  }  }, :node => {} } )	
	end	



  # GET /works/1
  # GET /works/1.xml
  def show
    @work = Work.find(params[:id])
		#if @work.assignedto_type == "AluGroup"
		#	@chatmessages = ChatMessage.joins(:grouptest_chatmessages).where(:grouptest_chatmessages => {:test_id => @work.tests}).includes(:grouptest_chatmessages)
			#!!! not used anymore see also tests#show
			#alugroup = @work.assignedto
			#@msgtable = ChatMessagesHelper.getChatMessagesTable(alugroup, Proc.new{|username1, username2| {:test_id => @work.tests, :from => username1, :to => username2} })
			#@msgtable = ChatMessagesHelper.getChatMessagesList(alugroup, @test.id)
#			#check image graph
#			if !File.exists?("#{CHATWORKIMAGESDIR}/#{@work.id}.png") 
#				ChatMessagesHelper.generatePngChat(@msgtable,"#{CHATWORKIMAGESDIR}/#{@work.id}")		
#			end
		#end
		#render :action => "show#{@work.assignedto_type}"
		render :action => "show"
  end

  # GET /works/new
  # GET /works/new.xml
  def new
    @work = Work.new
		@work.assignedto_id = params[:assignedto_id]
		@work.assignedto_type = params[:assignedto_type]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work }
    end
  end


	def newAll
		render
	end	


	def edit
    		@work = Work.find(params[:id])
	end	


	def getNodesDep
		@nodes = Array.new
		@worktype = params[:work][:worktype].to_i
		ActiveRecord::Base.logger.info "GET NODESS DEP"
		getNodesRecursive(params[:work][:assignedto_type] , params[:work][:assignedto_id], params[:work][:node_id], @nodes)
		render :partial => "nodes/nodesDep" , :layout => false
	end


  # POST /works
  # POST /works.xml
  def create
    @work = Work.new(params[:work])
		successave = createWork(@work.assignedto_type, @work.assignedto_id, @work.node_id, @work.initialpoints, @work.worktype )
		if successave.is_a?(Integer)
        flash[:notice] = 'El nodo ya esta asignado  y tiene tests.'
    		redirect_to :action => "new" , :assignedto_type => @work.assignedto_type, :assignedto_id => @work.assignedto_id , :course_id => @work.node.course_id
				return
		end
		#TODO transaction	
		if successave
		# craete works for predecessors (who don have any assigned with tests)
			params[:rel] and params[:rel].each do |node_id , dep|
				#check params type and dep (can be put in model)
				if dep.nil?
					dep = 0
				else
					dep = dep.to_f
				end	
				#put initialpoints of objective node, TODO hay nodos que pueden tener conocimiento previo 0
				#dep = @work.initialpoints	if dep == 0
				if params[:type] and params[:type][node_id]
					type = params[:type][node_id]	
				else
					type = Work::TEST_TYPE
				end
				createWork(@work.assignedto_type, @work.assignedto_id, node_id, dep, type )
				end
			flash[:notice] = t('work_created_success')
			redirect_to :action => "listByAssignedtoAndCourse" ,:assignedto_type =>@work.assignedto_type, :assignedto_id => @work.assignedto_id , :course_id => @work.node.course_id
		end
  end


	def createAll
		course = Course.find(params[:course_id])
		node_id = params[:node_id].to_i
		if params[:worktype]
			worktype = params[:worktype]
		else
			worktype = Work::TEST_TYPE
		end
		assignedtoIds = params[:assignedtoType] == Work::ASSIGNEDTOSTUDENT ? course.students.map{|s| s.id} : course.alu_groups.map{|ag| ag.id} 
		assignedtoIds.each do |assignedtoId|
			 createWork(params[:assignedtoType], assignedtoId, node_id, params[:initialpoints], worktype )
			#successors
			nodes = Array.new
			getNodesRecursive( params[:assignedtoType] , assignedtoId, node_id, nodes)
			nodes.each do |n|
				#create for all predecessors which do not have tests)
			 	createWork(params[:assignedtoType], assignedtoId, n.id, params[:initialpoints], worktype )
			end

		end
		redirect_to :controller => 'courses' , :action => "show" ,  :id => params[:course_id]
	end	

  def update
    @work = Work.find(params[:id])

    respond_to do |format|
      if @work.update_attributes(params[:work])
        flash[:notice] = t('work_updated_success')
        format.html { redirect_to(@work) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work.errors, :status => :unprocessable_entity }
      end
    end
  end



  # DELETE /works/1
  # DELETE /works/1.xml
  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to :action => "listByAssignedtoAndCourse" , :assignedto_type => @work.assignedto_type, :assignedto_id => @work.assignedto_id , :course_id => @work.node.course_id


  end


#  def deleteWorkImage
#		`rm -f #{CHATWORKIMAGESDIR}/#{params[:work_id]}.*`
#		redirect_to :action => 'show' , :id => params[:work_id] 
#  end


end
