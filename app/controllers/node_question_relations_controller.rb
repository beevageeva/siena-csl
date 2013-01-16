class NodeQuestionRelationsController < ApplicationController
include ActiveSupport::Inflector

 before_filter(:only => [:newNode , :newQuestion, :create , :update , :edit, :destroy, :getQuestionsDep, :getNodesDep] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }


layout :green_web

  # GET /node_question_relations/new
  # GET /node_question_relations/new.xml
  def newNode
    @node_question_relation = NodeQuestionRelation.new
		@node_question_relation.question_id = params[:question_id]
		@coursesoptions =  getCourses
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @node_question_relation }
    end
  end


	


  def newQuestion
    @node_question_relation = NodeQuestionRelation.new
		@node_question_relation.node_id = params[:node_id]
		@coursesoptions =  getCourses
   respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @node_question_relation }
    end
  end

  # GET /node_question_relations/1/edit
  def edit
    @node_question_relation = NodeQuestionRelation.find(params[:id])
  end

  # POST /node_question_relations
  # POST /node_question_relations.xml
  def create
		nextController = params[:next]
		prevController = params[:prev]
		return if (not ["question", "node"].include? nextController	)
		return if (not ["question", "node"].include? prevController	)
    @node_question_relation = NodeQuestionRelation.new(params[:node_question_relation])
		if NodeQuestionRelation.find_by_node_id_and_question_id(@node_question_relation.node_id, @node_question_relation.question_id)	
        flash[:notice] = t('nodequestionrelation_exists')
		else
			#no tiene que haber mas dependencias null porque esta puesto en el modelo que compruebe la dep float entre 0..1
      if @node_question_relation.save
        flash[:notice] = t('nodequestionrelation_created_success')
				redirect_to :controller => pluralize(nextController), :action => "edit" , :id => eval("@node_question_relation.#{nextController}_id") 
				return
      end
			end
		@coursesoptions =  getCourses
		render :action => "new#{camelize(prevController)}"
  end

  # PUT /node_question_relations/1
  # PUT /node_question_relations/1.xml
  def update
    @node_question_relation = NodeQuestionRelation.find(params[:id])

      if @node_question_relation.update_attributes(params[:node_question_relation])
        flash[:notice] = t('nodequestionrelation_updated_success')
				redirect_to @node_question_relation.question.course		
      else
        render :action => "edit" 
      end
  end

  # DELETE /node_question_relations/1
  # DELETE /node_question_relations/1.xml
  def destroy
    @node_question_relation = NodeQuestionRelation.find(params[:id])
    @node_question_relation.destroy
		
		redirect_to @node_question_relation.question.course		

  end



	def getNodesDep
		@nodesoptions = Node.find(:all , :conditions => ["course_id = #{params[:course_id]}"] ).collect {|u| [u.content , u.id]}
		ActiveRecord::Base.logger.warn("nodes dep") 
		ActiveRecord::Base.logger.warn(@nodesoptions) 
		render :partial => 'getNodesDep' , :layout => false
	end


	def getQuestionsDep
		@questionsoptions = Question.find(:all , :conditions => ["course_id = #{params[:course_id]}"] ).collect {|u| [u.content , u.id]} 
		ActiveRecord::Base.logger.warn("quest dep") 
		ActiveRecord::Base.logger.warn(@questionsoptions) 
		render :partial => 'getQuestionsDep' , :layout => false
	end


private
	def getCourses
		TeacherAssign.find(:all, :conditions => ["teacher_assigns.teacher_id = #{session[:useraccount_id]}"] ).collect{|u| [Course.find(u.course_id).name , u.course_id]}
	end

end
