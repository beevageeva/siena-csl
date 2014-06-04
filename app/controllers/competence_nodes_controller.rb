class CompetenceNodesController < ApplicationController

#TODO when are competeneces  used?
 before_filter(:only => [:show , :getNodesDep] ) { |c| c.auth nil  }
 before_filter(:only => [:index, :newNode, :create , :update , :edit , :destroy] ) { |c| c.auth  [ {:types =>  [User::PROF, User::ADMIN]  }]  }
	layout :green_web
  # GET /competence_nodes
  # GET /competence_nodes.xml
  def index
    @competence_nodes = CompetenceNode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @competence_nodes }
    end
  end

  # GET /competence_nodes/1
  # GET /competence_nodes/1.xml
  def show
    @competence_node = CompetenceNode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @competence_node }
    end
  end


  def newNode
    @competence_node = CompetenceNode.new
		@coursesoptions =  TeacherAssign.find(:all, :conditions => ["teacher_assigns.teacher_id = #{session[:useraccount_id]}"] ).collect{|u| [Course.find(u.course_id).name , u.course_id]}
    @competence_node.competence_id = params[:competence_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @competence_node }
    end
  end
  # GET /competence_nodes/1/edit
  def edit
    @competence_node = CompetenceNode.find(params[:id])
  end

  # POST /competence_nodes
  # POST /competence_nodes.xml
  def create
		if CompetenceNode.find_by_competence_id_and_node_id(params[:competence_node][:competence_id],params[:competence_node][:node_id])
        flash[:notice] = 'El nodo ya existe.'
				redirect_to :controller => 'competences' , :action => 'edit' , :id => params[:competence_node][:competence_id]
				return
		
		end
    @competence_node = CompetenceNode.new(cn_params)

      if @competence_node.save
        flash[:notice] = t('competencenode_created_success')
				redirect_to :controller => 'competences' , :action => 'edit' , :id => @competence_node.competence_id
      else
         render :action => "newAluGroup" 
      end
  end

  # PUT /competence_nodes/1
  # PUT /competence_nodes/1.xml
  def update
    @competence_node = CompetenceNode.find(params[:id])

    respond_to do |format|
      if @competence_node.update_attributes(params[:competence_node])
        flash[:notice] = t('competencenode_updated_success')
        format.html { redirect_to(@competence_node) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @competence_node.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /competence_nodes/1
  # DELETE /competence_nodes/1.xml
  def destroy
    @competence_node = CompetenceNode.find(params[:id])
    @competence_node.destroy

		redirect_to :controller => 'competences' , :action => 'edit' , :id => @competence_node.competence_id
  end


	def getNodesDep
		@nodesoptions = Node.find(:all , :conditions => ["course_id = #{params[:course_id]}"] ).collect {|u| [u.content , u.id]} 
		render :partial => 'getNodesDep' , :layout => false
	end

	private

	def cn_params
			params.require(:competence_node).permit(:node_id, :competence_id)
	end


end
